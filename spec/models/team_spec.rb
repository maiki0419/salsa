require 'rails_helper'

RSpec.describe Team, type: :model do

  describe "バリテーションテスト" do

    let(:team) {FactoryBot.build(:team)}

    context "nameカラム" do

      it "空白の場合エラー" do
        team.name = ""
        team.valid?
        expect(team.errors[:name]).to include("を入力してください")
      end

    end

    context "owner_idカラム" do

      it "空白の場合エラー" do
        team.owner_id = ""
        team.valid?
        expect(team.errors[:owner_id]).to include("を入力してください")
      end

    end

    context "prefecture_idカラム" do

      it "10文字以上の場合エラー" do
        team.prefecture_id = Faker::Lorem.characters(number: 11)
        team.valid?
        expect(team.errors[:prefecture_id]).to include("は10文字以内で入力してください")
      end

    end

    context "cityカラム" do

      it "10文字以上の場合エラー" do
        team.city = Faker::Lorem.characters(number: 11)
        team.valid?
        expect(team.errors[:city]).to include("は10文字以内で入力してください")
      end

    end

    context "levelカラム" do

      it "10文字以上の場合エラー" do
        team.level = Faker::Lorem.characters(number: 11)
        team.valid?
        expect(team.errors[:level]).to include("は10文字以内で入力してください")
      end

    end

    context "ageカラム" do

      it "10文字以上の場合エラー" do
        team.age = Faker::Lorem.characters(number: 11)
        team.valid?
        expect(team.errors[:age]).to include("は10文字以内で入力してください")
      end

    end

    context "member_countカラム" do

      it "10文字以上の場合エラー" do
        team.member_count = Faker::Lorem.characters(number: 11)
        team.valid?
        expect(team.errors[:member_count]).to include("は10文字以内で入力してください")
      end

    end

    context "introductionカラム" do

      it "10文字以上の場合エラー" do
        team.introduction = Faker::Lorem.characters(number: 1001)
        team.valid?
        expect(team.errors[:introduction]).to include("は1000文字以内で入力してください")
      end

    end

    context "activities_timeカラム" do

      it "10文字以上の場合エラー" do
        team.activities_time = Faker::Lorem.characters(number: 31)
        team.valid?
        expect(team.errors[:activities_time]).to include("は30文字以内で入力してください")
      end

    end

    context "foundedカラム" do

      it "10文字以上の場合エラー" do
        team.founded = Faker::Lorem.characters(number: 11)
        team.valid?
        expect(team.errors[:founded]).to include("は10文字以内で入力してください")
      end

    end

  end

  describe "アソシエーションテスト" do

    let(:association) {described_class.reflect_on_association(target)}

    context "TeamCustomerモデルとの関連" do

      let(:target) {:team_customers}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "TeamCustomer"
      end

    end

    context "Scheduleモデルとの関連" do

      let(:target) {:schedules}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Schedule"
      end

    end

    context "TeamRecordモデルとの関連" do

      let(:target) {:team_records}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "TeamRecord"
      end

    end

  end

end
