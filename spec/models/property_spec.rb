require "rails_helper"

RSpec.describe Property, type: :model do

  describe "relationships" do
    before :each do
      @property = create :property
    end

    it "should relate to a user" do
      expect(@property).to respond_to(:user)
      expect(@property.user).to be_a(User)
    end

    it "should require a user" do
      record = build(:property, user_id: nil)
      expect(record).to be_invalid
    end
  end
  
  describe "validation" do
    
    describe "name" do
        
      it 'is valid?' do
        property = create(:property, name: Faker::Name.name)
        expect(property).to be_valid
      end

      it "is not present" do
        property = build(:property, name: nil)
        expect(property).not_to be_valid
        expect(property.errors.messages).to have_key(:name)
        expect(property.errors.messages[:name]).to include("can't be blank")
      end
    
    end

    describe "description" do

      it "is valid?" do
        property = create(:property)
        expect(property).to be_valid
      end

      it "is not present" do
        property = build(:property, description: nil)
        expect(property).not_to be_valid
        expect(property.errors.messages).to have_key(:description)
        expect(property.errors.messages[:description]).to include("can't be blank")
      end

    end

    describe "assets_type" do
    
      it "should require a #assets_type" do
        record = build(:property, assets_type: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:assets_type)
        expect(record.errors.messages[:assets_type]).to include("can't be blank")
        
      end

      it "should require a valid #assets_type" do
        record = create(:property)
        expect(record).to be_valid
        expect { record.assets_type = :this_is_not_a_real_report_type }.to raise_error(ArgumentError)
      end

    end

    describe "purchase_date" do
    
      it "should require a #purchase_date" do
        record = build(:property, purchase_date: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:purchase_date)
        expect(record.errors.messages[:purchase_date]).to include("can't be blank")
      end

      it "should require a valid #purchase_date" do
        record = create(:property)
        expect(record).to be_valid
      end

    end

    describe "warranty_month" do
    
      it "should require a #warranty_month" do
        record = build(:property, warranty_month: nil)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:warranty_month)
        expect(record.errors.messages[:warranty_month]).to include("can't be blank")
      end

      it "should require a valid #warranty_month" do
        record = create(:property)
        expect(record).to be_valid
      end

      it "should out of warenty month between 0 and 120" do
        record = build(:property, warranty_month: 199)
        expect(record).to be_invalid
        expect(record.errors.messages).to have_key(:warranty_month)
        expect(record.errors.messages[:warranty_month]).to include("between 0 and 120")
      end

    end
    
  end
  
end
