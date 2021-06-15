FactoryBot.define do
  factory :director do
    sequence :name do |n|
      "Director no.#{n}"
    end

    country {'usa'}
    active {true}

    trait :inactive do
      active {false}
    end

    trait :aussie do
      country {'australia'}
    end
  end
end
    