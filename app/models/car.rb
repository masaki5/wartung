class Car < ApplicationRecord
    belongs_to :user

    has_many :logs, dependent: :destroy
    has_many :parts, dependent: :destroy
end
