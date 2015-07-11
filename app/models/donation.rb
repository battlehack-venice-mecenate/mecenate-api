class Donation < ActiveRecord::Base
  belongs_to :poi
  validates :amount_in_cents, :presence => true
  serialize :braintree_response, JSON

  def braintree_response=(response)
    response_hash = {}
    [:id, :type, :amount, :status, :created_at, :custom_fields].each do |key|
      response_hash[key] = response.send(:transaction).send(key)
    end

    [:first_name, :last_name, :email, :company, :website, :phone, :fax].each do |key|
      response_hash["customer_#{key}"] = response.send(:customer).try(key)
    end

    write_attribute(:braintree_response, response_hash)
  end
end
