require 'rails_helper'

RSpec.describe 'Partモデルのテスト', type: :model do


describe 'バリデーションのテスト' do
  let(:part) { build(:part) }
  subject { test_part.valid? }
  context 'nameカラム' do
    let(:test_part) { part }
    it '空欄でないこと' do
      test_part.name = ''
      is_expected.to eq false;
    end
  end
context 'emailカラム' do
  let(:test_part) { part }
  it '空欄ではないこと' do
    test_part.introduction = ''
    is_expected.to eq false
    end
  end
end
  describe 'アソシエーションのテスト' do
    context 'Logモデルとの関係' do
      it '1:Nとなっている' do
        expect(Part.reflect_on_association(:logs).macro).to eq :has_many
      end
    end
  end
end