puts "Creating Admin User"
User.find_or_create_by_email(:email                 => "admin@softwarenextdoor.com",
                             :password              => "password",
                             :password_confirmation => "password")

puts "Creating User Types"
UserType.find_or_create_by_name(:name => "Admin")
UserType.find_or_create_by_name(:name => "Developer")