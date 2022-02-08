require 'rails_helper'

RSpec.describe Ticket, type: :model do
    
  let (:ticket) { build_stubbed(:ticket) }

  describe "factory test" do
    it "has a name" do
      expect(ticket).to respond_to(:name)
    end
  end

  describe "Attributes" do 
    it "Belongs to a Region" do 
      should belong_to(:region)
    end

    it "Belongs to a Resource Category" do 
      should belong_to(:resource_category)
    end
  end
end
