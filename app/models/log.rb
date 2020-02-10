class Log < ApplicationRecord
    #スルー
    has_many :log_parts
    has_many :parts, through: :log_parts

end
