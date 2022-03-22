require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'バリデーションテスト' do
    let(:customer) {FactoryBot.build(:customer)}

    it "全てのカラムの値が正しければ登録できる" do
      expect(customer).to be_valid
    end

    context "nicknameカラム" do


      it "空欄の場合エラー" do
        customer = FactoryBot.build(:customer, nickname: "")
        customer.valid?
        expect(customer.errors[:nickname]).to include("を入力してください")
      end

      it "10文字以上の場合エラー" do
        customer = FactoryBot.build(:customer, nickname: "クリスティアーノ・ロナウド")
        customer.valid?
        expect(customer.errors[:nickname]).to include("は10文字以内で入力してください")
      end

    end

    context "emailカラム" do

      it "空白の場合エラー" do
        customer = FactoryBot.build(:customer, email: "")
        customer.valid?
        expect(customer.errors[:email]).to include("を入力してください")
      end

      it "重複していた場合エラー" do
        email = Faker::Internet.email
        customer = FactoryBot.create(:customer, email: email)
        customer2 = FactoryBot.build(:customer, email: email)
        customer2.valid?
        expect(customer2.errors[:email]).to include("はすでに存在します")
      end

    end

    context "passwordカラム" do

      it "空白の場合エラー" do
        customer = FactoryBot.build(:customer, password: "")
        customer.valid?
        expect(customer.errors[:password]).to include("を入力してください")
      end

      it "5文字以下の場合エラー" do
       customer = FactoryBot.build(:customer, password: "12345")
       customer.valid?
       expect(customer.errors[:password]).to include("は6文字以上で入力してください")
      end

      it "パスワードが一致していない場合エラー" do
        customer = FactoryBot.build(:customer, password: "123456", password_confirmation: "1234567")
        customer.valid?
        expect(customer.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

    end

    context "prefecture_idカラム" do

      it "10文字以上の場合エラー" do
        customer = FactoryBot.build(:customer, prefecture_id: Faker::Lorem.characters(number: 11))
        customer.valid?
        expect(customer.errors[:prefecture_id]).to include("は10文字以内で入力してください")
      end

    end

    context "city" do

      it "10文字以上の場合エラー" do
        customer = FactoryBot.build(:customer, city: Faker::Lorem.characters(number: 11))
        customer.valid?
        expect(customer.errors[:city]).to include("は10文字以内で入力してください")
      end

    end

    context "gender_id" do

      it "10文字以上の場合エラー" do
        customer = FactoryBot.build(:customer, gender_id: Faker::Lorem.characters(number: 11))
        customer.valid?
        expect(customer.errors[:gender_id]).to include("は10文字以内で入力してください")
      end

    end

    context "age" do

      it "10文字以上の場合エラー" do
        customer = FactoryBot.build(:customer, age: Faker::Lorem.characters(number: 11))
        customer.valid?
        expect(customer.errors[:age]).to include("は10文字以内で入力してください")
      end

    end

    context "introduction" do

      it "1000文字以上の場合エラー" do
        customer = FactoryBot.build(:customer, introduction: Faker::Lorem.characters(number: 1001))
        customer.valid?
        expect(customer.errors[:introduction]).to include("は1000文字以内で入力してください")
      end

    end

  end

  describe "アソシエーションテスト" do

    let(:association)do
      # described_classはRspec.describeの後に定義されているクラスが呼び出される(describe_class=Customer)
      # reflect_on_association(引数(モデル))は対象のクラスと引数で指定するクラスの関連を返す
      described_class.reflect_on_association(target)
    end

    context "CustomerRoomモデルとの関連" do
      # 変数associationに引数を入れる(targetにcustomer_rooms)
      let(:target) {:customer_rooms}

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "CustomerRoom"
      end

    end

    context "Chatモデルとの関連" do

      let(:target) {:chats}

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Chat"
      end
    end

    context "Relationship(followed_id)モデルとの関連" do

      let(:target) {:relationships}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Relationship"
      end

    end

    context "Relationship(follower_id)モデルとの関連" do

      let(:target) {:revers_of_relationships}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Relationship"
      end

    end

    context "Notification(visitor)との関連" do

      let(:target) {:active_notifications}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Notification"
      end
    end

    context "Notification(visited)との関連" do

      let(:target) {:passive_notifications}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Notification"
      end
    end

    context "TeamCustomerとの関連" do

      let(:target) {:team_customers}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "TeamCustomer"
      end
    end

    context "Favoriteとの関連" do

      let(:target) {:favorites}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Favorite"
      end
    end

    context "Postとの関連" do

      let(:target) {:posts}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "Post"
      end
    end

    context "PostCommentとの関連" do

      let(:target) {:post_comments}

      it "1:Nになっている" do
        expect(association.macro).to eq :has_many
      end

      it "関連しているモデル" do
        expect(association.class_name).to eq "PostComment"
      end
    end

  end

end
