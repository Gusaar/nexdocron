class Hour < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :total_hours, presence: true, numericality: { greater_than: 0 }

  attr_accessible :date, :project_id, :tasks_description, :total_hours, :user_id
end
