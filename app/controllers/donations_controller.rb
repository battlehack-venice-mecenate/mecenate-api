class DonationsController < ApplicationController
  def braintree_client_token
    render :json => {:client_token => Braintree::ClientToken.generate}
  end
end
