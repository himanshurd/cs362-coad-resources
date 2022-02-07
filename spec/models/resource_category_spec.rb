require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) {ResourceCategory.new(name: 'Fake Resource Category')}
  it 'exists' do
    ResourceCategory.new
  end

  describe "attributes" do
    it "has a name" do
      expect(resource_category).to respond_to(:name)
    end
  end

  describe "#to_s" do
    it 'returns the name' do
      name = resource_category.name
      expect(resource_category.to_s).to eq(name)
    end
  end

  describe "::unspecified" do
    it "returns the resourse category with the name 'unspecified' " do
      resource_category = ResourceCategory.unspecified
      expect(resource_category.name).to eq('unspecified')
    end
  end
  




  

end
