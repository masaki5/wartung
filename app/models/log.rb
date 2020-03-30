class Log < ApplicationRecord

    belongs_to :part
    validates :exchange, presence: true

end
