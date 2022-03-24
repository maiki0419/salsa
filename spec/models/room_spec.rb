require 'rails_helper'

RSpec.describe Room, type: :model do
  
  describe "アソシエーション" do
    
    let(:association) {described_class.reflect_on_association(target)}
    
    context "CustomerRoomとの関連" do
      
      let(:target) {:customer_rooms}
      
      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end
      
      it "関連しているモデル" do
        expect(association.class_name).to eq "CustomerRoom"
      end
      
    end
    
    context "Chatとの関連" do
      
      let(:target) {:chats}
      
      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end
      
      it "関連しているモデル" do
        expect(association.class_name).to eq "Chat"
      end
      
    end
    
  end
  
end
