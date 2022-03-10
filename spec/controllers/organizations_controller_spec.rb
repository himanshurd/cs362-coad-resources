require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  describe "Non Logged in User" do 
    it "Redirects Back to Sign-In Screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      post :approve, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      post :reject, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  
  describe "Approved Organization User" do 
    it "Redirects Back to Dashboard" do
      organization_user = create(:user)
      organization_user.confirm
      sign_in(organization_user)
      
      get :new 
      expect(response).to redirect_to(dashboard_path)
      post :create
      expect(response).to redirect_to(dashboard_path)
      post :approve, params: {id:'fake'}
      expect(response).to redirect_to(dashboard_path)
      post :reject, params: {id:'fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end
  describe "Unapproved Organization User" do
    it "Redirects Back to Dashboard" do
      organization_user = create(:user)
      organization_user.confirm
      organization_user.organization=nil
      organization_user.save
      sign_in(organization_user)
      
      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      post :approve, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      post :reject, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
