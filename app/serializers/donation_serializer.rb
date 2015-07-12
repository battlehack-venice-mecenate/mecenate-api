class DonationSerializer < ActiveModel::Serializer
  attributes :id, :amount_in_cents, :braintree_response, :email
end

