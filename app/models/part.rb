class Part < ApplicationRecord
    belongs_to :car
    #中間テーブルのlog_partをスルーしてlogにいける
    has_one :log_part
    has_one :log, through: :log_part

    #part createした際にlogも一緒に作成
    after_save :create_log

    def create_log
        log = Log.new
        log.save
        log.parts << self
    end
end
