require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  it "admin rejects a submitted organization" do
    add_org=create(:organization, :set_submitted)
    admin = create(:user, :admin_user)
    admin.confirm
    log_in_as(admin)

    visit "/organizations"
    click_link("Pending")
    click_on("Review")
    click_on("Reject")
    expect(page).to have_text('has been rejected')
  end
end
