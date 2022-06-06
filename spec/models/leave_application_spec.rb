require 'rails_helper'

RSpec.describe LeaveApplication, type: :model do

  describe "validation" do
  
    describe "description" do

      it "is valid?" do
        record = create(:leave_application)
        expect(record).to be_valid
      end

      it "is not present" do
        record = build(:leave_application, description: nil)
        expect(record).not_to be_valid
        expect(record.errors.messages).to have_key(:description)
        expect(record.errors.messages[:description]).to include("can't be blank")
      end

    end

    describe "#from_date" do
    
      it "is valid" do
        record = create(:leave_application)
        expect(record).to be_valid  
      end

      it "is not pressent" do 
        record = build(:leave_application, from_date: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:from_date)
        expect(record.errors.messages[:from_date]).to include("can't be blank")
      end

    end

    describe "#to_date" do
    
      it "is valid" do
        record = create(:leave_application)
        expect(record).to be_valid  
      end

      it "is not pressent" do 
        record = build(:leave_application, to_date: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:to_date)
        expect(record.errors.messages[:to_date]).to include("can't be blank")
      end

    end

    describe "leave_type" do
    
      it "should require a #leave_type" do
        record = build(:leave_application, leave_type: nil)
        expect(record).to be_invalid
        expect(record.errors.messages[:leave_type]).to include("can't be blank")
        
      end

      it "should require a valid #leave_type" do
        record = create(:leave_application)
        expect(record).to be_valid
        expect { record.leave_type = :this_is_not_a_real_leave_type }.to raise_error(ArgumentError)
      end

    end

    describe "#date_scope validation" do

      it 'must be past to to_date or equal' do
        leave = build(:leave_application, from_date: '2021-12-14', to_date: '2021-12-13')
        expect(leave).to be_invalid
        expect(leave.errors[:from_date]).to eq(['must be past to to_date or equal'])
      end

      it "to time is not present" do 
        record = build(:leave_application, half_day: true, to_time: nil, from_date: '2021-12-14', to_date: '2021-12-14' )
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:to_time)
        expect(record.errors.messages[:to_time]).to include("can't be blank")
      end

      it "from time is not present" do 
        record = build(:leave_application, half_day: true, from_time: nil, from_date: '2021-12-14', to_date: '2021-12-14')
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:from_time)
        expect(record.errors.messages[:from_time]).to include("can't be blank")
      end

      it 'to date is present' do
        record = build(:leave_application, half_day: true, from_time: Time.now - 4.hours, to_time: Time.now - 3.hours, from_date: '2021-12-14', to_date: '2021-12-13')
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:to_date)
        expect(record.errors.messages[:to_date]).to include("& from date must be same")
      end

      it 'if half day is not checked' do
        record = build(:leave_application, half_day: false, from_time: Time.now - 4.hours, to_time: Time.now - 3.hours, from_date: '2021-12-14', to_date: '2021-12-13')
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:to_time)
        expect(record.errors.messages[:to_time]).to include("must be blank if half_day not checked")
      end


      it 'if half day is not checked' do
        record = build(:leave_application, half_day: false, from_time: Time.now - 4.hours, to_time: Time.now - 3.hours, from_date: '2021-12-14', to_date: '2021-12-13')
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:from_time)
        expect(record.errors.messages[:from_time]).to include("must be blank if half_day not checked")
      end
    end
  end
  
end