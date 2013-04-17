class Client < ActiveRecord::Base
  has_many :projects
  attr_accessible :contact_email, :contact_name, :contact_phone, :name, :skype_id
end
