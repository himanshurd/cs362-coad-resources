require 'rails_helper'

RSpec.describe Region, type: :model do

  let (:region) { Region.new(name: 'Fake Region') }
  it 'exists' do
    Region.new
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

end
