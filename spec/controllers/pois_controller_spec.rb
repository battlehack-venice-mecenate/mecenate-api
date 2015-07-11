require 'rails_helper'

describe PoisController do
  describe '#index' do
    before do
      30.times { create(:poi) }
    end

    it 'is OK' do
      get :index
      expect(response.status).to eq(200)
    end

    describe 'pagination' do
      it 'responds with the first page' do
        get :index
        expect(JSON.load(response.body)['pois'].size).to eq(25)
      end

      it 'includes meta' do
        get :index
        expect(JSON.load(response.body)['meta']).not_to be(nil)
      end
    end
  end

  describe '#show' do
    let(:poi) { create(:poi) }

    it 'is OK' do
      get :show, :id => poi.id
      expect(response.status).to eq(200)
    end

    context 'with a non-existing POI' do
      it 'raises ActiveRecord::RecordNotFound' do
        expect { get :show, :id => 'foo' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
