require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe "アソシエーションテスト" do

    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "visitor(Customer)モデルとの関係" do

      let(:target) {:visitor}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end
    
    context "visited(Customer)モデルとの関係" do

      let(:target) {:visited}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end
    
    context "Postモデルとの関係" do

      let(:target) {:post}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Post"
      end

    end
    
    context "Commentモデルとの関係" do

      let(:target) {:post_comment}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "PostComment"
      end

    end

  end

end
