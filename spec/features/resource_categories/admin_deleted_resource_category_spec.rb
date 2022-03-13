require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    before do
      create(:resource_category, name: "Delete_Category")
      user = create(:user, :admin)
      user.confirm
      log_in_as(user)
      visit '/resource_categories'
    end
  
    scenario "admin sucefully deletes resource category" do
      click_on "Delete_Category"
      click_on "Delete"
  
      expect(page).to have_text("Category Delete_Category was deleted")
    end
end