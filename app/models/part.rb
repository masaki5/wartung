class Part < ApplicationRecord
    belongs_to :car
    has_many :logs

    after_save :create_log

    def create_log
        log = Log.new
        log.part_id = id
        log.save
    end
end
