require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Carモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:cars).macro).to eq :has_many
      end
    end
  end
end