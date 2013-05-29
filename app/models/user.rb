class User < ActiveRecord::Base
  belongs_to :user_type
  belongs_to :holy_day_list

  has_many :hours

  has_many :user_projects
  has_many :projects, through: :user_projects

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :skype_id, :phone, :mobile, :rate, :project_ids, :holy_day_list_id

  validates :username, :uniqueness => { :allow_blank => true, :allow_nil => true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, phone_number: { leading_1: true }, allow_blank: true, allow_nil: true
  validates :mobile, phone_number: { leading_1: true }, allow_blank: true, allow_nil: true
  validates :user_type, presence: true
  validates :rate, numericality: { greater_than: 0 }, allow_blank: true, allow_nil: true

  class << self
    def with_missing_hours_in_month(date)
      users = {}
      all.each do |user|
        users[user] = user.hours.where('date BETWEEN ? AND ?', date.beginning_of_month, date.end_of_month).map(&:total_hours).sum.to_f
      end 
      users.reject{ |user, hours| hours >= user.month_total_hours(date) }
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    user_type.name == "Admin"
  end

  def month_total_hours(date)
    @holy_days = self.holy_day_list.nil? ? [] : self.holy_day_list.formatted_days
    ((date.beginning_of_month..date.end_of_month).to_a.reject do |d| 
      d.saturday? || d.sunday? || @holy_days.include?(d.strftime('%d/%m/%Y'))
    end.count * 8).to_f
  end
end
