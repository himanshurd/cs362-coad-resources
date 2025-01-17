require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  let (:ticket) { build(:ticket) }

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
  

    describe "All Organization" do
      it "Accept open tickets" do
        open_ticket = create(:ticket, :organization_id)
        expect(Ticket.all_organization).to include(open_ticket)
      end

      it "Do not accept nil organizations tickets" do
        nil_ticket = create(:ticket)
        expect(Ticket.all_organization).to_not include(nil_ticket)
      end
    
      it "Do not accept closed tickets" do
        closed_ticket = create(:ticket, :closed, :organization_id)
        expect(Ticket.all_organization).to_not include(closed_ticket)
      end
    end

    describe "Organization" do 
      it "Accept open tickets with an organization name" do 
        open_ticket = create(:ticket, :organization_id)
        expect(Ticket.organization(5)).to include(open_ticket)
      end

      it "Do not accept closed tickets with an organization name" do 
        closed_ticket = create(:ticket, :closed, :organization_id)
        expect(Ticket.organization(5)).to_not include(closed_ticket)
      end

      it "Do not accept open tickets without organization name" do 
        nil_ticket = create(:ticket)
        expect(Ticket.organization(5)).to_not include(nil_ticket)
      end
    end

    describe "Closed Organization" do 
      it "Accept closed tickets with an organization name" do 
        closed_ticket = create(:ticket, :closed, :organization_id)
        expect(Ticket.closed_organization(5)).to include(closed_ticket)
      end

      it "Do not accept open tickets with an organization name" do 
        open_ticket = create(:ticket, :organization_id)
        expect(Ticket.closed_organization(5)).to_not include(open_ticket)
      end

      it "Do not accept open tickets without organization name" do 
        nil_ticket = create(:ticket)
        expect(Ticket.closed_organization(5)).to_not include(nil_ticket)
      end
    end

    describe "Region" do 
      it "Ticket has a valid region_id" do 
        valid_ticket = create(:ticket)
        expect(Ticket.region(1)).to include(valid_ticket)
      end
    end

    describe "Resource Category" do
      it "Ticket has a valid resource_category_id" do 
        valid_ticket = create(:ticket)
        expect(Ticket.resource_category(1)).to include(valid_ticket)
      end
    end
  end

  describe "Methods" do
    describe "#open?" do 
      it "Open if ticket is not closed" do
        expect(ticket.closed).to eq(false)
        expect(ticket.open?).to eq(true)
      end

      it "not open if ticket is closed" do
        ticket= Ticket.new(closed: true)
        expect(ticket.closed).to eq(true)
        expect(ticket.open?).to eq(false)
      end
    end

    describe "#captured?" do
      it "Is captured if organization is present, " do
        ticket.organization=Organization.new
        expect(ticket.captured?).to eq(true)
        expect(ticket.organization.present?).to eq(true)
      end

      it "Is not captured if organization is not present" do
        expect(ticket.organization.present?).to eq(false)
        expect(ticket.captured?).to eq(false)
      end
    end

    describe "to_s" do 
      it "Returns Ticket id number" do 
        expect(ticket.to_s).to eq("Ticket ")
        ticket=Ticket.new(id:1)
        expect(ticket.to_s).to eq("Ticket 1")
      end
    end
  end
end
