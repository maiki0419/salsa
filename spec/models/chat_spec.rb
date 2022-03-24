require 'rails_helper'

RSpec.describe Chat, type: :model do

  describe "バリデーションテスト" do

    let(:customer) {FactoryBot.create(:customer)}
    let(:room) {FactoryBot.create(:room)}
    let(:chat) {FactoryBot.build(:chat)}
    context "messageカラム" do

      it "空白の場合エラー" do
        chat.message = ""
        chat.valid?
        expect(chat.errors[:message]).to include("を入力してください")
      end

      it "100文字以上の場合エラー" do
        chat.message = Faker::Lorem.characters(number: 101)
        chat.valid?
        expect(chat.errors[:message]).to include("は100文字以内で入力してください")
      end

    end

    context "room_idカラム" do

      it "空白の場合エラー" do
        chat.room_id = ""
        chat.valid?
        expect(chat.errors[:room_id]).to include("を入力してください")
      end

    end

    context "customer_idカラム" do

      it "空白の場合エラー" do
        chat.customer_id = ""
        chat.valid?
        expect(chat.errors[:customer_id]).to include("を入力してください")
      end

    end

  end

  describe "アソシエーションテスト" do

    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Customerとの関連" do

      let(:target) {:customer}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end

    context "Roomとの関連" do

      let(:target) {:room}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Room"
      end

    end

    context "Notificationとの関連" do

      let(:target) {:notifications}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Notification"
      end

    end

  end

end
