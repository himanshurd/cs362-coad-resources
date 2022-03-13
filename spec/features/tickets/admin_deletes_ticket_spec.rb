require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
    before do
        create(:ticket, name: "Delete_ticket")
        user = create(:user, :admin)
        user.confirm
        log_in_as(user)
        visit '/dashboard'
      end
    
      scenario "successful in deletion of ticket" do
        click_on "Delete_ticket"
        click_on "Delete"
        expect(page).to_not have_text("Delete_ticket")
      end

end
