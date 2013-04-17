class Hour < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  attr_accessible :date, :project_id, :tasks_description, :total_hours, :user_id
end
