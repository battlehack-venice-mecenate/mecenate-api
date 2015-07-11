require 'rails_helper'

describe Poi do
  describe 'validations' do
    [:name, :lat, :lon].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end
end
