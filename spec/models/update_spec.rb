require 'rails_helper'

RSpec.describe Update, type: :model do
  
  describe "relationships" do
    before :each do
      @update = create :update
    end

    it "should relate to a user" do
      expect(@update).to respond_to(:project)
      expect(@update.project).to be_a(Project)
    end

    it "should require a user" do
      record = build(:update, project_id: nil)
      expect(record).to be_invalid
    end
  end

  describe "validation" do
  
    describe "#in_time" do
    
      it "is valid" do
        record = create(:update)
        expect(record).to be_valid  
      end

      it "is not pressent" do 
        record = build(:update, in_time: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:in_time)
        expect(record.errors.messages[:in_time]).to include("can't be blank")
      end

    end

    describe "#out_time" do
    
      it "is valid" do
        record = create(:update)
        expect(record).to be_valid  
      end

      it "is not pressent" do 
        record = build(:update, out_time: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:out_time)
        expect(record.errors.messages[:out_time]).to include("must be greater than Start time.")
      end

    end

    describe "description" do

      it "is valid?" do
        record = create(:update)
        expect(record).to be_valid
      end

      it "is not present" do
        record = build(:update, description: nil)
        expect(record).not_to be_valid
        expect(record.errors.messages).to have_key(:description)
        expect(record.errors.messages[:description]).to include("can't be blank")
      end

    end

  end

end