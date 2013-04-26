puts "Creating User Types"
admin_type = UserType.find_or_create_by_name(:name => "Admin", 
                                             :description => "System Administrator.")
developer_type = UserType.find_or_create_by_name(:name => "Developer", 
                                             :description => "Developer.")

puts "Creating Admin User"
admin_user = User.find_or_create_by_email(:email                 => "admin@softwarenextdoor.com",
                                          :username              => "Admin",
                                          :first_name            => "Admin",
                                          :last_name             => "Account",
                                          :password              => "password",
                                          :password_confirmation => "password")
admin_user.user_type = admin_type
admin_user.save

puts "Creating Invoicing Types"
InvoicingType.find_or_create_by_name(:name => "Beweekly",
                                     :description => "Every two weeks.")
InvoicingType.find_or_create_by_name(:name => "Monthly",
                                     :description => "Every month.")