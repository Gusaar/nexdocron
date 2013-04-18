class UserType < ActiveRecord::Base
  has_many :users

  attr_accessible :name, :description
end
