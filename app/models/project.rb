class Project < ActiveRecord::Base
  attr_accessible :client_id, :end_date, :invoicing_id, :name, :start_date, :total_hours
end
