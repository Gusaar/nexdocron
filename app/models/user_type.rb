class UserType < ActiveRecord::Base
  has_many :users

  attr_accessible :description
end
