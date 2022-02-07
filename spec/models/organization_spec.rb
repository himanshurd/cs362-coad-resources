require 'rails_helper'

RSpec.describe Organization, type: :model do
    
  let (:organization) { build_stubbed(:organization) }

  describe "attributes" do
    it "has a name" do
      expect(organization).to respond_to(:name)
    end
  end
end
