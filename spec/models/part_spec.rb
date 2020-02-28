require 'rails_helper'

RSpec.describe 'Partモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Logモデルとの関係' do
      it '1:Nとなっている' do
        expect(Part.reflect_on_association(:logs).macro).to eq :has_many
      end
    end
  end
end