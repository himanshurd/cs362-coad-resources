require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) {Ticket.new(name: "Fake Tickets", phone: "111111111", description: "Here is your Fake ticket") }
  
  describe "factory attribute tests" do
    it "has a name" do
      expect(ticket).to respond_to(:name)
    end
    
    it "has a description" do
      expect(ticket).to respond_to(:description)
    end
    it "has a phone number" do
      expect(ticket).to respond_to(:phone)
    end
  end
  
  describe "validations" do
    it { ticket.should validate_presence_of(:name) }
    it { ticket.should validate_presence_of(:phone) }
    it { ticket.should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { ticket.should validate_length_of(:description).is_at_most(1020) }
    #it { ticket.should validate(:phone)}
  end

end
