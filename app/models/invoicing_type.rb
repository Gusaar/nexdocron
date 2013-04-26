class InvoicingType < ActiveRecord::Base
  has_many :projects

  validates :name, presence: true
  validates :description, presence: true

  attr_accessible :name, :description
end
