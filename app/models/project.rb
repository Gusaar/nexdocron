class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :invoicing_type

  attr_accessible :client_id, :end_date, :invoicing_id, :name, :start_date, :total_hours
end
