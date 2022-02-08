require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) {ResourceCategory.new(name: "Fake Resource  Category") }

  describe "attributes" do
    it "has a name" do
      expect(resource_category).to respond_to(:name)
    end
  end

  describe "validations" do 
    it { resource_category.should validate_presence_of(:name) }
    it { resource_category.should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { resource_category.should validate_uniqueness_of(:name).case_insensitive }
  end


  describe "methods" do
    it 'returns the name' do
      name = resource_category.name
      expect(resource_category.to_s).to eq(name)
    end

    it "activate" do
      resource_category.activate
      expect(resource_category.active).to be_truthy
    end

    it "deactivate" do
      resource_category.deactivate
      expect(resource_category.activate).to be_truthy
    end

    it "inactivate?" do
      expect(resource_category.inactive?).to be_falsy
    end

    it "returns the resourse category with the name 'unspecified' " do
      resource_category = ResourceCategory.unspecified
      expect(resource_category.name).to eq('Unspecified')  
    end  
  end

  describe "associations" do
    it { resource_category.should have_many(:tickets) }
    it { resource_category.should have_and_belong_to_many(:organizations) }
  end
end

