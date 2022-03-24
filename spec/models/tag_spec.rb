require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe "バリデーションテスト" do

    let(:tag) {FactoryBot.create(:tag)}

    context "nameカラム" do

      it "重複の場合エラー" do
        tag2 = FactoryBot.build(:tag, name: tag.name)
        tag2.valid?
        expect(tag2.errors[:name]).to include("はすでに存在します")
      end

      it "10文字以上の場合エラー" do
        tag = FactoryBot.build(:tag, name: Faker::Lorem.characters(number: 11))
        tag.valid?
        expect(tag.errors[:name]).to include("は10文字以内で入力してください")
      end

    end

  end


  describe "アソシエーションテスト" do

    let(:association) {described_class.reflect_on_association(target)}

    context "PostTagモデルとの関連" do

      let(:target) {:post_tags}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "PostTag"
      end

    end

  end



end
