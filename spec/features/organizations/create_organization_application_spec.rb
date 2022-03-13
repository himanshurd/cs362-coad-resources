require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do 
    it "new user's application" do    
        user = create(:user)
        user.confirm
        user.organization = nil
        user.save!
        log_in_as(user)

        visit "/organizations/new"

        choose("organization_liability_insurance_true")
        choose("organization_agreement_one_true")
        choose("organization_agreement_two_true")
        choose("organization_agreement_three_true")
        choose("organization_agreement_four_true")
        choose("organization_agreement_five_true")
        choose("organization_agreement_six_true")
        choose("organization_agreement_seven_true")
        choose("organization_agreement_eight_true")
        fill_in("organization_primary_name", with: "Fake Primary Name")
        fill_in("organization_secondary_name", with: "Fake Seondary Name")
        fill_in("organization_name", with: "fake Name")
        fill_in("organization_title", with: "Fake Org Title")
        fill_in("organization_phone", with: "+15037998087")
        fill_in("organization_secondary_phone", with: "+15034567890")
        fill_in("organization_email", with: "Fake@Email.com")
        choose("organization_transportation_yes")
        click_on("Apply")
        expect(page).to have_text("Application")
    end
end
