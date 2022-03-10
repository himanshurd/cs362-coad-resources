require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "Non Logged in User" do
    it "No Redirection" do
      get :index
      expect(response.redirect?).to be(false)
    end
  end
end
