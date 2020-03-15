require 'rails_helper'

RSpec.describe 'Logモデルのテスト', type: :model do
    describe 'アソシエーションのテスト' do
    context 'Partモデルとの関係' do
      it 'N:1となっている' do
        expect(Log.reflect_on_association(:part).macro).to eq :belongs_to
      end
    end
  end
end