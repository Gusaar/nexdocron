require 'spec_helper'

describe Admin::ProjectsController do
  let!(:client) { FactoryGirl.create(:client) }
  before (:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

  describe "GET index" do
    it "assigns @projects" do
      projects = Project.all
      get :index
      assigns(:projects).should eq(projects)
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @project" do
      project = FactoryGirl.create(:project)
      get :show, id: project
      assigns(:project).should eq(project)
    end
    
    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:project)
      response.should render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new project" do
        expect{
          post :create, project: FactoryGirl.attributes_for(:project).merge(client_id: client)
        }.to change(Project,:count).by(1)
      end
      
      it "redirects to the new project" do
        post :create, project: FactoryGirl.attributes_for(:project).merge(client_id: client)
        response.should redirect_to admin_projects_path
      end
    end
  end

  describe 'PUT update' do
    before :each do
      @project = FactoryGirl.create(:project)
    end
    
    context "valid attributes" do
      it "located the requested @project" do
        put :update, id: @project, project: FactoryGirl.attributes_for(:project)
        assigns(:project).should eq(@project)      
      end
    
      it "changes @project's attributes" do
        put :update, id: @project, 
          project: FactoryGirl.attributes_for(:project, name: "Project Test")
        @project.reload
        @project.name.should eq('Project Test')
      end
    
      it "redirects to the updated project" do
        put :update, id: @project, project: FactoryGirl.attributes_for(:project)
        response.should redirect_to admin_projects_path
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @project = FactoryGirl.create(:project)
    end
    
    it "deletes the project" do
      expect{
        delete :destroy, id: @project        
      }.to change(Project,:count).by(-1)
    end
      
    it "redirects to project#index" do
      delete :destroy, id: @project
      response.should redirect_to admin_projects_path
    end
  end
end
