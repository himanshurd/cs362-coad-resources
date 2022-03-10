require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "Non Logged in User" do 
    it "Redirects Back to Dashboard" do
      get :show, params: {id: 'Fake'} 
      expect(response).to redirect_to(dashboard_path)
      post :capture, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      post :release, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      patch :close, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "Approved Organization User" do 
    it "Redirects Back to Dashboard"  do
      organization_user = create(:user)
      organization_user.confirm
      sign_in(organization_user)
      
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "Unapproved Organization User" do 
    it "Redirects Back to Dashboard"  do
      organization_user = create(:user)
      organization_user.confirm
      organization_user.organization=nil
      organization_user.save
      sign_in(organization_user)

      get :show, params: {id:'Fake'}
      expect(response).to redirect_to(dashboard_path)
      post :capture, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      post :release, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      post :close, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end 

