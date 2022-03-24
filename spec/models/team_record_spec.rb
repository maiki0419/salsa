require 'rails_helper'

RSpec.describe TeamRecord, type: :model do

  describe 'バリデーションテスト' do

    let(:team) {FactoryBot.create(:team)}

    let(:team_record) {FactoryBot.build(:team_record, team_id: team.id)}

    context "dayカラム" do

      it "空白の場合エラー" do
        team_record.day = ""
        team_record.valid?
        expect(team_record.errors[:day]).to include("を入力してください")
      end

      it "10文字以上の場合エラー" do
        team_record.day = Faker::Lorem.characters(number: 11)
        team_record.valid?
        expect(team_record.errors[:day]).to include("は10文字以内で入力してください")
      end

    end

    context "team_idカラム" do

      it "空白の場合エラー" do
        team_record.team_id = ""
        team_record.valid?
        expect(team_record.errors[:team_id]).to include("を入力してください")
      end

    end

    context "placeカラム" do

      it "空白の場合エラー" do
        team_record.place = ""
        team_record.valid?
        expect(team_record.errors[:place]).to include("を入力してください")
      end

      it "20文字以上の場合エラー" do
        team_record.place = Faker::Lorem.characters(number: 21)
        team_record.valid?
        expect(team_record.errors[:place]).to include("は20文字以内で入力してください")
      end

    end

    context "opponentカラム" do

      it "空白の場合エラー" do
        team_record.opponent = ""
        team_record.valid?
        expect(team_record.errors[:opponent]).to include("を入力してください")
      end

      it "20文字以上の場合エラー" do
        team_record.opponent = Faker::Lorem.characters(number: 21)
        team_record.valid?
        expect(team_record.errors[:opponent]).to include("は20文字以内で入力してください")
      end

    end

    context "scoreカラム" do

      it "空白の場合エラー" do
        team_record.score = ""
        team_record.valid?
        expect(team_record.errors[:score]).to include("を入力してください")
      end

      it "10文字以上の場合エラー" do
        team_record.score = Faker::Lorem.characters(number: 11)
        team_record.valid?
        expect(team_record.errors[:score]).to include("は10文字以内で入力してください")
      end

    end

    context "noteカラム" do

      it "30文字以上の場合エラー" do
        team_record.note = Faker::Lorem.characters(number: 31)
        team_record.valid?
        expect(team_record.errors[:note]).to include("は30文字以内で入力してください")
      end

    end

    context "resultカラム" do

      it "空白の場合エラー" do
        team_record.result = ""
        team_record.valid?
        expect(team_record.errors[:result]).to include("を入力してください")
      end

      it "10文字以上の場合エラー" do
        team_record.result = Faker::Lorem.characters(number: 11)
        team_record.valid?
        expect(team_record.errors[:result]).to include("は10文字以内で入力してください")
      end

    end

  end
  
  describe "アソシエーションテスト" do

    let(:association) {described_class.reflect_on_association(target)}
    
    context "Teamモデルとの関連" do

      let(:target) {:team}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Team"
      end
      
    end
    
  end

end
