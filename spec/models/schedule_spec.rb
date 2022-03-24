require 'rails_helper'

RSpec.describe Schedule, type: :model do
  
  describe 'バリデーションテスト' do
    
    let(:team) {FactoryBot.create(:team)}
    
    let(:schedule) {FactoryBot.build(:schedule, team_id: team.id)}
    
    context "titleカラム" do
      
      it "空白の場合エラー" do
        schedule.title = ""
        schedule.valid?
        expect(schedule.errors[:title]).to include("を入力してください")
      end
      
      it "20文字以上の場合エラー" do
        schedule.title = Faker::Lorem.characters(number: 21)
        schedule.valid?
        expect(schedule.errors[:title]).to include("は20文字以内で入力してください")
      end
      
    end
    
    context "team_idカラム" do
      
      it "空白の場合エラー" do
        schedule.team_id = ""
        schedule.valid?
        expect(schedule.errors[:team_id]).to include("を入力してください")
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
