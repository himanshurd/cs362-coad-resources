require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  describe "a non logged in person" do 
    it "redirects into sign in" do
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
