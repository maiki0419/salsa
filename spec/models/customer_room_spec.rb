require 'rails_helper'

RSpec.describe CustomerRoom, type: :model do
  describe "アソシエーションテスト" do

    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Customerモデルとの関連" do

      let(:target) {:customer}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Customer"
      end

    end

    context "Roomモデルとの関連" do

      let(:target) {:room}

      it "N:1になっている" do
        expect(association.macro).to eq :belongs_to
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Room"
      end

    end

  end
end
