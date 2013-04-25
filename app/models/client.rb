class Client < ActiveRecord::Base
  has_many :projects

  validates :name, presence: true
  validates :contact_phone, phone_number: { leading_1: true }
  validates :contact_email, email: true

  attr_accessible :contact_email, :contact_name, :contact_phone, :name, :skype_id
end
