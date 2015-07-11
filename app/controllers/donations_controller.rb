class DonationsController < ApplicationController
  attr_accessor :poi
  before_action :find_poi!, :only => [:create]

  def braintree_client_token
    render :json => {:client_token => Braintree::ClientToken.generate}
  end

  def create
    donation = poi.donations.build(donation_params)
    response = Braintree::Transaction.sale(:amount => '%.02f' % (donation.amount_in_cents.to_i / 100.0),
      :payment_method_nonce => nonce_from_client)

    donation.success = response.success?
    if donation.success?
      donation.braintree_response = response
      if donation.save
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
    params.permit(:amount_in_cents, :anonymous)
  end

  def nonce_from_client
    params[:payment_method_nonce]
  end
end
