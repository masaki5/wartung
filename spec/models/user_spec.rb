require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do


  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
      let(:test_user) { user }
      it '空欄ではないこと' do
        test_user.email = ''
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Carモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:cars).macro).to eq :has_many
      end
    end
  end
end
