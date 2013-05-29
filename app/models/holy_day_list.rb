class HolyDayList < ActiveRecord::Base
  has_many :holy_days
  has_many :users

  validates :name, uniqueness: true, presence: true

  attr_accessible :name

  def days
    holy_days.order('day ASC').map(&:day)
  end

  def formatted_days
    holy_days.order('day ASC').map{ |hd| hd.day.strftime('%d/%m/%Y') }
  end
end
