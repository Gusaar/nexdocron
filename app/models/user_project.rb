class UserProject < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user, presence: true
  validates :project, presence: true

  attr_accessible :project_id, :user_id
end
