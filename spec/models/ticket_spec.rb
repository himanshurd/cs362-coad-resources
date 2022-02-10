require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  let (:ticket) { build_stubbed(:ticket) }

  describe "Belongs to" do 
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

  describe "Validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1020) }
    # Need validation for phone
  end

  describe "Scopes" do 
    it 'Open tickets' do
      open_ticket = create(:ticket)
      expect(Ticket.closed).to_not include(open_ticket)
    end
    
    it 'Closed tickets' do
      closed_ticket = create(:ticket, :closed)
      expect(Ticket.closed).to include(closed_ticket)
    end
  end
end
