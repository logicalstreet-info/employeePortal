require 'rails_helper'

RSpec.describe Bond, type: :model do
  
  describe "validation" do
    
    describe "StartDate" do
      
      it "is valid?" do
        record = build(:bond)
        expect(record).to be_valid
      end

      it "is not valid?" do
        record = build(:bond, start_date: nil)
        expect(record).not_to be_valid
        expect(record.errors.messages[:start_date]).to include("can't be blank")
      end

    end

    describe "StartDate" do
      
      it "is valid?" do
        record = build(:bond, end_date: Date.today + 1)
        expect(record).to be_valid
      end

      it "is not valid?" do
        record = build(:bond, end_date: nil)
        expect(record).not_to be_valid
        expect(record.errors.messages[:end_date]).to include("can't be blank")
      end

    end



  end

end
