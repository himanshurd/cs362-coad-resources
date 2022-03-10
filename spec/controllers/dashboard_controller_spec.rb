require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "Non Logged in User" do 
    it "Redirects Back to Sign-In Screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
