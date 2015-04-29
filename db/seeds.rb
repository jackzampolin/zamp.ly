require 'faker'

50.times do
  Url.new(path: Faker::Internet.url).save
end