puts "Creating Admin User"
User.find_or_create_by_email(:email                 => "admin@softwarenextdoor.com",
                             :password              => "password",
                             :password_confirmation => "password")
