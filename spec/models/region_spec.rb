require 'rails_helper'

RSpec.describe Region, type: :model do

  let (:region) { build(:region) }

  it "has a name" do 
    region = build(:region)
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    my_region = region()
    my_region.name = 'NEW NAME'
    expect(region.to_s).to eq(region.name)
  end

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
end
