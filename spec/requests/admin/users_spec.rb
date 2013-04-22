require 'spec_helper'

describe "Admin::Users" do
  before (:each) do
    admin_sign_in
  end

  describe "GET /admin/users", :type => :feature do
    it "should let admin see the users list" do
      visit admin_users_path
      expect(page).to have_content('All Users')
    end
  end

  describe "POST /admin/users", :type => :feature do
    it "should create an user" do
      visit new_admin_user_path
      expect(page).to have_content('New User')
      fill_in 'First name', with: "Test"
      fill_in 'Last name', with: "User"
      fill_in 'Username', with: "testing"
      fill_in 'Email', with: "test@user_example.com"
      fill_in 'Password', with: "password"
      fill_in 'Password Confirmation', with: "password"
      select('Admin', :from => 'User Type')
      click_button 'Save'
      expect(page).to have_content('User created successfully.')
    end
  end

  describe "PUT /admin/users/ID", :type => :feature do
    it "should update an user" do
      user = User.last || FactoryGirl.create(:user)
      visit edit_admin_user_path(user.id)
      expect(page).to have_content('Edit User')
      fill_in 'First name', with: "Test"
      fill_in 'Last name', with: "User"
      fill_in 'Username', with: "testing"
      select('Admin', :from => 'User Type')
      click_button 'Save'
      expect(page).to have_content('User updated successfully.')
    end
  end
end
