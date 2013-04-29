class Hour < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :total_hours, presence: true, numericality: { greater_than: 0 }
  validates :tasks_description, presence: true
  validates :date, presence: true
  validates :project, presence: true
  validates :user, presence: true

  attr_accessible :date, :project, :tasks_description, :total_hours, :user_id
end
