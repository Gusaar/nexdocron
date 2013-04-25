class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :invoicing_type

  has_many :hours
  has_many :change_orders

  has_many :user_projects
  has_many :users, through: :user_projects

  validates :name, presence: true
  validates :total_hours, numericality: { greater_than: 0 }
  validates :client, presence: true

  attr_accessible :client_id, :end_date, :invoicing_id, :name, :start_date, :total_hours, :invoicing_type_id, :client_id, :user_ids
end
