class Log < ApplicationRecord
    #スルー
    has_many :log_parts, dependent: :destroy
    has_many :parts, through: :log_parts

    #accepts_nested_attributes_for :parts

end
