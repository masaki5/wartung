require 'rails_helper'

RSpec.describe 'Carモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Partモデルとの関係' do
      it '1:Nとなっている' do
        expect(Car.reflect_on_association(:parts).macro).to eq :has_many
      end
    end
  end
end