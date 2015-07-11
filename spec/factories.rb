FactoryGirl.define do
  factory :poi do
    sequence(:name) {|n| "Mecenate POI ##{n}"}
    lat 45.564560
    lon 12.428084
  end
end
