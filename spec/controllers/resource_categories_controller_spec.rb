require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  describe "Non Logged in User" do 
    it "Redirects Back to Sign-In Screen" do
      patch :activate, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      patch :deactivate, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
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
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
