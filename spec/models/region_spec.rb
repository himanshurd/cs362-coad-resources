require 'rails_helper'

RSpec.describe Region, type: :model do

  let (:region) { build(:region) }
  
  describe "attributes" do
    it "has a name" do 
      region = Region.new
      expect(Region).to respond_to(:name)
    end
  end

  describe "#to_s" do 
    it "returns the name" do 
      name = region.name
      region = Region.new(name: name)
      expect(region.to_s).to eq(name)
    end
  end

  describe "::unspecified" do
    it "returns a Region with the name 'Unspecified'" do 
      region = Region.unspecified
      expect(region.name).to eq('Unspecified')
    end
  end

  describe "validations" do 
    it "No blank names" do 
      expect(region).to be_valid
      region.name=nil
      expect(region).to_not be_valid
    end

    it "Name length 1-255" do 
      should validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it "Must be unique" do 
      should validate_uniqueness_of(:name).case_insensitive
    end
  end
end