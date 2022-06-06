require 'rails_helper'

RSpec.describe User, type: :model do

  context "validation" do 
    
    context "email" do
      
      it 'is valid?' do
        user = create(:user, email: Faker::Internet.email, mobile_number: 1111111111, parent_mobile_number: 2222222222)
        expect(user).to be_valid
      end

      it "is not present" do
        user_type = build(:user, email: nil)
        expect(user_type).not_to be_valid
        expect(user_type.errors.messages).to have_key(:email)
        expect(user_type.errors.messages[:email]).to include("can't be blank")
      end
    
      it "is require unique" do 
        user = create(:user, email: "#{Faker::Lorem.word}@hiclark.com", mobile_number: 1111111111, parent_mobile_number: 2222222222)
        expect(user).to be_valid
      end
    
      it "is invalid because that email format is incorrect" do
        second = build(:user, email: 'abcadmin,com')
        expect(second).not_to be_valid
        expect(second.errors.messages).to have_key(:email)
        expect(second.errors.messages[:email]).to include("Invalid email")
      end
    
    end

    context "mobile number" do
      
      it "is valid?" do
        user = create(:user, mobile_number: 1111111111, parent_mobile_number: 2222222222)
        expect(user).to be_valid
      end
      
      it "is not valid because the mobile number is not 10 chars" do
        user = build(:user, mobile_number: 1111111)
        expect(user).not_to be_valid
        expect(user.errors.messages).to have_key(:mobile_number)
        expect(user.errors.messages[:mobile_number]).to include("must be 10 digit long")
      end
      
      it "is invalid because the mobile format is incorrect" do 
        second = build(:user, mobile_number: :f11124ch44)
        expect(second).not_to be_valid
        expect(second.errors.messages).to have_key(:mobile_number)
        expect(second.errors.messages[:mobile_number]).to include(" must be in xxxxxxxxxx format.")
      end
    
    end
    
    context "parent mobile number" do 
      it "is valid?" do
        user = create(:user, parent_mobile_number: 2222222222, mobile_number: 1111111111 )
        expect(user).to be_valid
      end
      
      it "is not valid because the parent mobile number is not 10 chars" do
        user = build(:user, parent_mobile_number: 2222222)
        expect(user).not_to be_valid
        expect(user.errors.messages).to have_key(:parent_mobile_number)
        expect(user.errors.messages[:parent_mobile_number]).to include("must be 10 digit long")
      end
      
      it "is invalid because the mobile format is incorrect" do 
        second = build(:user, parent_mobile_number: :f11124ch44)
        expect(second).not_to be_valid
        expect(second.errors.messages).to have_key(:parent_mobile_number)
        expect(second.errors.messages[:parent_mobile_number]).to include(" must be in xxxxxxxxxx format.")

      end
    end

    context "birthdate" do 

      it 'Should allow valid birth date' do
        user = create(:user, birth_date: 19.years.ago, parent_mobile_number: 2222222222, mobile_number: 1111111111)
        expect(user.birth_date).to be <= 18.years.ago.to_date
      end
    
    end

    context "#validate_password_complexity" do
      
      it "password is valid" do
        user = create(:user, password: 123456, password_confirmation: 123456, mobile_number: 1111111111, parent_mobile_number: 2222222222 )
        expect(user).to be_valid
      end

      it "password is not present" do
        user = build(:user, password: nil)
        expect(user).not_to be_valid
        expect(user.errors.messages).to have_key(:password)
        expect(user.errors.messages[:password]).to include("can't be blank")
      end

      describe "when password does not contain at least 6 characters" do
        it "password is not valid" do
          user = build(:user, password: "Hc1$")
          expect(user).not_to be_valid
          expect(user.errors.messages).to have_key(:password)
          expect(user.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
        end
      end
    
    end
    
  end
  
end



  