require 'rails_helper'

describe DonationsController do
  describe '#braintree_client_token' do
    it 'is OK' do
      get :braintree_client_token
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    let(:poi) { create(:poi) }
    let(:valid_params) { {
      :id => poi.id,
      :payment_method_nonce => Braintree::Test::Nonce::Transactable,
      :amount_in_cents => (foo = Random.rand(100)) == 0 ? Random.rand(100) : foo,
      :anonymous => false
    } }

    it 'is OK' do
      post :create, valid_params
      expect(response.status).to eq(200)
    end

    describe 'payment_method_nonce' do
      it 'is required' do
        expect { post :create, valid_params.reject {|p, v| p == :payment_method_nonce} }.to raise_error(ActionController::ParameterMissing)
      end
    end

    describe 'amount_in_cents' do
      it 'is required' do
        expect { post :create, valid_params.reject {|p, v| p == :amount_in_cents} }.to raise_error(ActionController::ParameterMissing)
      end
    end

    describe 'with a consumed nonce' do
      it 'is a bad request' do
        post :create, valid_params.merge(:payment_method_nonce => Braintree::Test::Nonce::Consumed)
        expect(response.status).to eq(400)
      end
    end
  end

  describe '#poi_index' do
    let(:poi) { create(:poi) }
    before do
      30.times { create(:donation, :poi => poi) }
    end

    it 'is OK' do
      get :poi_index, :id => poi.id
      expect(response.status).to eq(200)
    end

    describe 'pagination' do
      it 'responds with the first page' do
        get :poi_index, :id => poi.id
        expect(JSON.load(response.body)['donations'].size).to eq(10)
      end

      it 'includes meta' do
        get :poi_index, :id => poi.id
        expect(JSON.load(response.body)['meta']).not_to be(nil)
      end
    end
  end

  describe '#index' do
    before do
      30.times { create(:donation) }
    end

    it 'is OK' do
      get :index
      expect(response.status).to eq(200)
    end

    describe 'pagination' do
      it 'responds with the first page' do
        get :index
        expect(JSON.load(response.body)['donations'].size).to eq(25)
      end

      it 'includes meta' do
        get :index
        expect(JSON.load(response.body)['meta']).not_to be(nil)
      end
    end
  end
end
