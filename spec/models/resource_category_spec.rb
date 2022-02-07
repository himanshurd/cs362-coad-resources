require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  
  let (:resource_category) { build(:resource_category) }

  it "has a name" do 
    expect(resource_category).to respond_to(:name)
  end

end
