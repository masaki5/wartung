class Car < ApplicationRecord
    belongs_to :user

    has_many :parts, dependent: :destroy
    has_many :logs, through: :parts
end
