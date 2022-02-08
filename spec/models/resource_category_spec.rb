require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) { build(:resource_category) }
  
  it "has a name" do 
    expect(resource_category).to respond_to(:name)
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
end
#   describe "::unspecified" do
#     it "returns the resourse category with the name 'unspecified' " do
#       resource_category = ResourceCategory.unspecified
#       expect(resource_category.name).to eq('unspecified')
#     end
#   end

  # describe "associations" do
  #   it "it has many tickets" do
  #     expect(resource_category).to have_many(:tickets)
  #   end
  # end
  
  # describe "validations" do
  #   it "cannot have a black name" do
  #     name = resource_category.name
  #     expect(name).to be_valid
  #     resource_category.name = nil
  #     expect(resource_category).to_not be_valid
  #   end
  # end
#   it "cannot have a length greater than 255" do
#     expect(resource_category).to validates_length_of(resource_category.name).is_at_least(1).is_at_most(255)
#   end

#   it "must have a unique name" do
#     duplicate_name = 'Fake Resource Category'
#     resource_category = ResourceCategory.create!(name: duplicate_name)
#     duplicate_resource_category = ResourceCategory.new(nam: 'Unique Name')
#     expect(duplicate_resource_category).to be_valid
#     duplicate_resource_category.name = duplicate_name
#     expect(duplicate_resource_category).to be_invalid
#   end
# end