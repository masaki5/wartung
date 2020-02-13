class Part < ApplicationRecord
    belongs_to :car
    has_many :logs, dependent: :destroy

    #中間テーブルのlog_partをスルーしてlogにいける
    #has_one :log_part, dependent: :destroy
    #has_one :log, dependent: :destroy, through: :log_part


    validates :name, uniqueness: { scope: :car_id }
    #part createした際にlogも一緒に作成
    after_update :create_log

    def create_log
        log = Log.new
        log.part_id = id
        log.save
    end

    #def create_log
        #log = Log.new
        #log.save
        #log.parts << self
    #end
end
