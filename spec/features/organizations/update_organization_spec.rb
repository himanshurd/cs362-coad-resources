require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    it "Update user's information" do
        user = create(:user, :organization)
        user.confirm
        log_in_as(user)
        user.organization.approve
        user.organization.save!
    
        visit "/dashboard"
        
        click_on("Edit Organization")
        click_on("Update")
        expect(page).to have_current_path("/organizations/#{user.organization.id}")
      end
end
