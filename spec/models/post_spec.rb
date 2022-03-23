require 'rails_helper'

RSpec.describe Post, type: :model do

   describe 'バリデーションテスト' do

      let(:customer) {FactoryBot.create(:customer)}

      let(:post) {FactoryBot.build(:post, customer_id: customer.id)}

      context "customer_idカラム" do

        it "空白の場合エラー" do
          post.customer_id = ""
          post.valid?
          expect(post.errors[:customer_id]).to include("を入力してください")
        end

      end

      context "post_categroyカラム" do

        it "空白の場合エラー" do
          post.post_categroy = ""
          post.valid?
          expect(post.errors[:post_categroy]).to include("を入力してください")
        end

      end

      context "titleカラム" do

        it "空白の場合エラー" do
          post.title = ""
          post.valid?
          expect(post.errors[:title]).to include("を入力してください")
        end

        it "20文字以上の場合エラー" do
          post.title = Faker::Lorem.characters(number: 21)
          post.valid?
          expect(post.errors[:title]).to include("は20文字以内で入力してください")
        end

      end

      context "bodyカラム" do

        it "1000文字以上の場合エラー" do
          post.body = Faker::Lorem.characters(number: 1001)
          post.valid?
          expect(post.errors[:body]).to include("は1000文字以内で入力してください")
        end

      end

       context "start_dateカラム" do

        it "10文字以上の場合エラー" do
          post.start_date = Faker::Lorem.characters(number: 11)
          post.valid?
          expect(post.errors[:start_date]).to include("は10文字以内で入力してください")
        end

      end

      context "deadlineカラム" do

        it "空白の場合エラー" do
          post.deadline = ""
          post.valid?
          expect(post.errors[:deadline]).to include("を入力してください")
        end

        it "10文字以上の場合エラー" do
          post.deadline = Faker::Lorem.characters(number: 11)
          post.valid?
          expect(post.errors[:deadline]).to include("は10文字以内で入力してください")
        end

      end

      context "prefecture_idカラム" do

        it "空白の場合エラー" do
          post.prefecture_id = ""
          post.valid?
          expect(post.errors[:prefecture_id]).to include("を入力してください")
        end

        it "10文字以上の場合エラー" do
          post.prefecture_id = Faker::Lorem.characters(number: 11)
          post.valid?
          expect(post.errors[:prefecture_id]).to include("は10文字以内で入力してください")
        end

      end

      context "cityカラム" do

        it "10文字以上の場合エラー" do
          post.city = Faker::Lorem.characters(number: 11)
          post.valid?
          expect(post.errors[:city]).to include("は10文字以内で入力してください")
        end

      end

      context "capacityカラム" do

        it "10文字以上の場合エラー" do
          post.capacity = Faker::Lorem.characters(number: 11)
          post.valid?
          expect(post.errors[:capacity]).to include("は10文字以内で入力してください")
        end

      end

      context "placeカラム" do

        it "10文字以上の場合エラー" do
          post.place = Faker::Lorem.characters(number: 21)
          post.valid?
          expect(post.errors[:place]).to include("は20文字以内で入力してください")
        end

      end

    end
    
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
      
      context "Favoriteモデルとの関連" do
  
        let(:target) {:favorites}
  
        it "1:Nになっている" do
          expect(association.macro).to eq :has_many
        end
  
        it "関連しているモデル" do
          expect(association.class_name).to eq "Favorite"
        end
        
      end
      
      context "Notificationモデルとの関連" do
  
        let(:target) {:notifications}
  
        it "1:Nになっている" do
          expect(association.macro).to eq :has_many
        end
  
        it "関連しているモデル" do
          expect(association.class_name).to eq "Notification"
        end
        
      end
      
      context "PostTagモデルとの関連" do
  
        let(:target) {:post_tags}
  
        it "1:Nになっている" do
          expect(association.macro).to eq :has_many
        end
  
        it "関連しているモデル" do
          expect(association.class_name).to eq "PostTag"
        end
        
      end
      
      context "PostCommentモデルとの関連" do
  
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
