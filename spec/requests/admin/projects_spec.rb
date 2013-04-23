require 'spec_helper'

describe "Admin::Projects" do
  before (:each) do
    admin_sign_in
  end

  describe "GET /admin/projects", :type => :feature do
    it "should let admin see the projects list" do
      visit admin_projects_path
      expect(page).to have_content('All Projects')
    end
  end

  describe "POST /admin/projects", :type => :feature do
    it "should create an project" do
      FactoryGirl.create(:client)
      FactoryGirl.create(:invoicing_type)
      visit new_admin_project_path
      expect(page).to have_content('New Project')
      fill_in 'Name', with: "Test"
      click_button 'Save'
      expect(page).to have_content('Project created successfully.')
    end
  end

  describe "PUT /admin/projects/ID", :type => :feature do
    it "should update an project" do
      project = Project.last || FactoryGirl.create(:project)
      visit edit_admin_project_path(project.id)
      expect(page).to have_content('Edit Project')
      fill_in 'Name', with: "Test Project"
      click_button 'Save'
      expect(page).to have_content('Project updated successfully.')
    end
  end

  describe "GET /admin/projects/ID", :type => :feature do
    it "should show project data" do
      project = Project.last || FactoryGirl.create(:project)
      visit admin_project_path(project.id)
      expect(page).to have_content(project.name)
    end
  end
end
