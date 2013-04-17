class ChangeOrder < ActiveRecord::Base
  belongs_to :project

  attr_accessible :date, :end_date, :hours, :project_id
end
