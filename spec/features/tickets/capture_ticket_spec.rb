require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  it "successful" do
    user = create(:user)
    user.confirm
    log_in_as(user)
    ticket = create(:ticket)

    visit "/dashboard/#ticket"
    expect(page).to have_text "#{ticket.name}"
    click_on("#{ticket.name}")
    click_on('Capture')
    click_on("#{ticket.name}")
    expect(page).to have_text "Release"
    expect(page).to have_text "Close"
  end
end
