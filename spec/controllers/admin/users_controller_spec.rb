require 'spec_helper'

describe Admin::UsersController do
  before (:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

  describe "GET index" do
    it "assigns @users" do
      users = User.all
      get :index
      assigns(:users).should eq(users)
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      assigns(:user).should eq(user)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:user)
      response.should render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User,:count).by(1)
      end
      
      it "redirects to the new user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to admin_users_path
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, user: {}
        }.to_not change(User,:count)
      end
      
      it "re-renders the new method" do
        post :create, user: {}
        response.should render_template :new
      end
    end 
  end

  describe 'PUT update' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    
    context "valid attributes" do
      it "located the requested @user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        assigns(:user).should eq(@user)      
      end
    
      it "changes @user's attributes" do
        put :update, id: @user, 
          user: FactoryGirl.attributes_for(:user, first_name: "Larry", last_name: "Smith")
        @user.reload
        @user.first_name.should eq("Larry")
        @user.last_name.should eq("Smith")
      end
    
      it "redirects to the updated user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to admin_users_path
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    
    it "deletes the user" do
      expect{
        delete :destroy, id: @user        
      }.to change(User,:count).by(-1)
    end
      
    it "redirects to users#index" do
      delete :destroy, id: @user
      response.should redirect_to admin_users_path
    end
  end
end
