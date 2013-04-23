require 'spec_helper'

describe "Admin::Clients" do
  before (:each) do
    admin_sign_in
  end

  describe "GET /admin/clients", :type => :feature do
    it "should let admin see the clients list" do
      visit admin_clients_path
      expect(page).to have_content('All Clients')
    end
  end

  describe "POST /admin/clients", :type => :feature do
    it "should create an client" do
      visit new_admin_client_path
      expect(page).to have_content('New Client')
      fill_in 'Name', with: "Test"
      click_button 'Save'
      expect(page).to have_content('Client created successfully.')
    end
  end

  describe "PUT /admin/clients/ID", :type => :feature do
    it "should update an client" do
      client = Client.last || FactoryGirl.create(:client)
      visit edit_admin_client_path(client.id)
      expect(page).to have_content('Edit Client')
      fill_in 'Name', with: "Test Client"
      click_button 'Save'
      expect(page).to have_content('Client updated successfully.')
    end
  end

  describe "GET /admin/clients/ID", :type => :feature do
    it "should show client data" do
      client = Client.last || FactoryGirl.create(:client)
      visit admin_client_path(client.id)
      expect(page).to have_content(client.name)
    end
  end
end
