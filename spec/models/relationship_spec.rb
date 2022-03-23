require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
 
  
  

  describe "アソシエーションテスト" do

    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "followed(Customer)モデルとの関連" do

      let(:target) {:followed}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end

    context "follower(Customer)モデルとの関連" do

      let(:target) {:follower}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end

  end

end
