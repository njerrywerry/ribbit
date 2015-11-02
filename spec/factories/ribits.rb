require 'faker'

FactoryGirl.define do
  factory :ribit do |f|
    f.content { Faker::Lorem.characters(140) }
  end

  factory :invalid_ribit, parent: :ribit do |f|
    f.content nil
  end
end
