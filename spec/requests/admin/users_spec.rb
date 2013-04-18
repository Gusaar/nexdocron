require 'spec_helper'

describe "Admin::Users" do
  before (:each) do
    admin_sign_in
  end

  describe "GET /admin/users", :type => :feature do
    it "works! (now write some real specs)" do
      visit admin_users_path
      expect(page).to have_content('All Users')
    end
  end
end
