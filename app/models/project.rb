class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :invoicing_type

  has_many :hours
  has_many :change_orders
  has_many :users, through: :user_projects

  attr_accessible :client_id, :end_date, :invoicing_id, :name, :start_date, :total_hours, :invoicing_type_id, :client_id
end
