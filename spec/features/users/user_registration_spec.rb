require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
    scenario "New user" do
        visit 'signup'
    
        fill_in "Email address", with: "Fake.new@Email.com"
        fill_in "Password", with: "New_Fake_password"
    end
end
