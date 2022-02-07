require 'rails_helper'

RSpec.describe Ticket, type: :model do
    
    let (:ticket) { build_stubbed(:ticket) }

    describe "factory test" do
        it "has a name" do
          expect(ticket).to respond_to(:name)
        end
    end
end
