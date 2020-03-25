class Part < ApplicationRecord
    belongs_to :car
    has_many :logs, dependent: :destroy

    validates :name, presence: true
    validates :name, uniqueness: { scope: :car_id }

end
