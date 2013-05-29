class HolyDay < ActiveRecord::Base
  belongs_to :holy_day_list
  
  attr_accessible :day
end
