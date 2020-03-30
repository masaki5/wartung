require 'rails_helper'

RSpec.describe 'Carモデルのテスト', type: :model do


  describe 'バリデーションのテスト' do
    let(:car) { build(:car) }
    subject { test_car.valid? }
    context 'nameカラム' do
      let(:test_car) { car }
      it '空欄でないこと' do
        test_car.name = ''
        is_expected.to eq false;
      end
    end
    context 'mileageカラム' do
      let(:test_car) { car }
      it '空欄ではないこと' do
        test_car.mileage = ''
        is_expected.to eq false
      end
    end
    context 'inspectionカラム' do
      let(:test_car) { car }
      it '空欄ではないこと' do
        test_car.inspection = ''
        is_expected.to eq false
      end
    end
        context 'registerカラム' do
      let(:test_car) { car }
      it '空欄ではないこと' do
        test_car.register = ''
        is_expected.to eq false
      end
    end
        context 'car_inspectionカラム' do
      let(:test_car) { car }
      it '空欄ではないこと' do
        test_car.car_inspection = ''
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Partモデルとの関係' do
      it '1:Nとなっている' do
        expect(Car.reflect_on_association(:parts).macro).to eq :has_many
      end
    end
  end
end