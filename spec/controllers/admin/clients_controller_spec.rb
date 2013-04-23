require 'spec_helper'

describe Admin::ClientsController do
  before (:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

  describe "GET index" do
    it "assigns @clients" do
      clients = Client.all
      get :index
      assigns(:clients).should eq(clients)
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @client" do
      client = FactoryGirl.create(:client)
      get :show, id: client
      assigns(:client).should eq(client)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:client)
      response.should render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new client" do
        expect{
          post :create, client: FactoryGirl.attributes_for(:client)
        }.to change(Client,:count).by(1)
      end
      
      it "redirects to the new client" do
        post :create, client: FactoryGirl.attributes_for(:client)
        response.should redirect_to admin_clients_path
      end
    end
  end

  describe 'PUT update' do
    before :each do
      @client = FactoryGirl.create(:client)
    end
    
    context "valid attributes" do
      it "located the requested @client" do
        put :update, id: @client, client: FactoryGirl.attributes_for(:client)
        assigns(:client).should eq(@client)      
      end
    
      it "changes @client's attributes" do
        put :update, id: @client, 
          client: FactoryGirl.attributes_for(:client, name: "Client Test")
        @client.reload
        @client.name.should eq('Client Test')
      end
    
      it "redirects to the updated client" do
        put :update, id: @client, client: FactoryGirl.attributes_for(:client)
        response.should redirect_to admin_clients_path
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @client = FactoryGirl.create(:client)
    end
    
    it "deletes the client" do
      expect{
        delete :destroy, id: @client        
      }.to change(Client,:count).by(-1)
    end
      
    it "redirects to clients#index" do
      delete :destroy, id: @client
      response.should redirect_to admin_clients_path
    end
  end
end