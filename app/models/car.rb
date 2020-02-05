class Car < ApplicationRecord
    belongs_to :user, optional: true

    has_many :log
    has_many :part
end
