require 'rails_helper'

describe DonationsController do
  describe '#braintree_client_token' do
    it 'is OK' do
      get :braintree_client_token
      expect(response.status).to eq(200)
    end
  end
end
