class ChangeOrder < ActiveRecord::Base
  belongs_to :project

  validates :hours, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

  attr_accessible :date, :end_date, :hours, :project_id
end
