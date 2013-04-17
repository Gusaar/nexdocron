class InvoicingType < ActiveRecord::Base
  has_many :projects

  attr_accessible :description
end
