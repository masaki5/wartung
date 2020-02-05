class Part < ApplicationRecord
    belongs_to :car

    has_many :log
end
