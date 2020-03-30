FactoryBot.define do
  factory :car do
    name { Faker::Lorem.characters(number:10) }
    mileage { '2222' }
    inspection { '2019/12/12'}
    register { '2019/12/12' }
    car_inspection { '2019/12/12' }
  end
end

# register, :inspection, :car_inspection