FactoryGirl.define do
  factory :poi do
    sequence(:name) {|n| "Mecenate POI ##{n}"}
    lat 45.564560
    lon 12.428084
  end

  factory :donation do
    before(:create) {|donation| donation.send(:write_attribute, :braintree_response, {'foo' => 'bar'})}
    poi
    amount_in_cents 100
  end
end
