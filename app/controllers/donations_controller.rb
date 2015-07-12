class DonationsController < ApplicationController
  attr_accessor :poi
  before_action :find_poi!, :only => [:create]

  def braintree_client_token
    render :json => {:client_token => Braintree::ClientToken.generate}
  end

  def index
    donations = Donation.order(:id => :desc).page(params[:page])
    render :json => donations, :meta => pagination_meta(donations)
  end

  def poi_index
    donations = Donation.where(:poi_id => params[:id]).order(:id).page(params[:page])
    render :json => donations, :meta => pagination_meta(donations)
  end

  def create
    donation = poi.donations.build(donation_params)
    response = Braintree::Transaction.sale(:amount => '%.02f' % (donation.amount_in_cents.to_i / 100.0),
      :payment_method_nonce => nonce_from_client, :custom_fields => {:poi_id => poi.id, :poi_name => poi.name})

    donation.success = response.success?
    if donation.success?
      donation.braintree_response = response
      if donation.save
        if donation.email.present?
          client = SendGrid::Client.new(:api_user => ENV['SENDGRID_USERNAME'], :api_key => ENV['SENDGRID_PASSWORD'])
          mail = SendGrid::Mail.new do |m|
            m.to = donation.email
            m.from = 'support@mecenate-api'
            m.from_name = 'Mecenate'
            m.subject = 'Thank you!'
            m.text = "Thank you for helping Italy mantains #{poi.name}! You algo get a chance to win a ticket for an exclusive event around the monument!"
          end
          client.send(mail)
        end

        render :json => donation
        return
      end

      render :json => {:errors => donation.errors.messages}, :status => 400
    else
      render :json => {:errors => [response.message]}, :status => 400
    end
  end

  private

  def find_poi!
    self.poi = Poi.find(params[:id])
  end

  def donation_params
    params.require(:payment_method_nonce)
    params.require(:amount_in_cents)
    params.permit(:amount_in_cents, :anonymous, :email)
  end

  def nonce_from_client
    params[:payment_method_nonce]
  end
end
