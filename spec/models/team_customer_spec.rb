require 'rails_helper'

RSpec.describe TeamCustomer, type: :model do

  describe "アソシエーション" do

    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Customerモデルとの関係" do

      let(:target) {:customer}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end

    context "Teamモデルとの関係" do

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
