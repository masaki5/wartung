class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cars, dependent: :destroy
         validates :name, presence: true

      def self.search(search)
        if search
            User.where(['name LIKE ?', "%#{search}%"])
        else
            User.all
        end
      end
end
