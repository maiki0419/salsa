require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe "アソシエーションテスト" do

    let(:association) {described_class.reflect_on_association(target)}

    context "Tagモデルとの関連" do

      let(:target) {:tag}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Tag"
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
