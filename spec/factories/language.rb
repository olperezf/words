FactoryBot.define do
  factory :language do
    name { 'English' }

    trait :spanish do
      name { 'Spanish' }
    end
  end
end
