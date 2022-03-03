require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  describe "creating a ticket" do 
    before do 
    create(:region)
    create(:resource_category)
    end
    
    scenario "non-logged in user creates a ticket" do 
      visit new_ticket_url
      fill_in "Full Name", with: "Fake User"
      fill_in "Phone Number", with: "5053456745"
      select 'Fake Region', from: 'Region'
      select 'Fake Resource Category', from: 'Resource Category'
      fill_in "Description", with: "Fake Description"
      click_on "Send this help request"
      expect(page).to have_text "Ticket Submitted" 
    end
  end
end
