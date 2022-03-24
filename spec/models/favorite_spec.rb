require 'rails_helper'

RSpec.describe Favorite, type: :model do

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

  end

end
