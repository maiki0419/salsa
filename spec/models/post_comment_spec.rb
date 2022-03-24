require 'rails_helper'

RSpec.describe PostComment, type: :model do

  describe "バリデーションテスト" do

    let(:post_comment) {FactoryBot.create(:post_comment)}

    context "commentカラム" do

      it "空白の場合エラー" do
        post_comment.comment = ""
        post_comment.valid?
        expect(post_comment.errors[:comment]).to include("を入力してください")
      end

      it "10文字以上の場合エラー" do
        post_comment.comment = Faker::Lorem.characters(number: 101)
        post_comment.valid?
        expect(post_comment.errors[:comment]).to include("は100文字以内で入力してください")
      end

    end

  end


  describe "アソシエーションテスト" do

    let(:association) {described_class.reflect_on_association(target)}

    context "Customerモデルとの関連" do

      let(:target) {:customer}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end

    context "Postモデルとの関連" do

      let(:target) {:post}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Post"
      end

    end


    context "Notificationモデルとの関連" do

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
