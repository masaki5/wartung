class Car < ApplicationRecord
    belongs_to :user

    has_many :parts, dependent: :destroy
    has_many :logs, through: :parts

    validates :name, :mileage, :register, :inspection, :car_inspection, presence: true

end
