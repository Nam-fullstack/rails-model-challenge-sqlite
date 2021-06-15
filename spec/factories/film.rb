FactoryBot.define do
  factory :film do
    sequence :title do |n| 
      "Test film no.#{n}" 
    end

    description {"Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows."}
    year {2000}
    genre {'Test Genre'}

    director

    trait :ancient do
      year {1899}
    end

    trait :crime do
      genre {'crime'}
    end

    trait :drama do 
      genre {'drama'}
    end
  end
end