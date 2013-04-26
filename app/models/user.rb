class User < ActiveRecord::Base
  belongs_to :user_type

  has_many :hours

  has_many :user_projects
  has_many :projects, through: :user_projects

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :skype_id, :phone, :mobile, :rate, :project_ids

  validates :username, :uniqueness => { :allow_blank => true, :allow_nil => true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, phone_number: { leading_1: true }, allow_blank: true, allow_nil: true
  validates :mobile, phone_number: { leading_1: true }, allow_blank: true, allow_nil: true
  validates :user_type, presence: true
  validates :rate, numericality: { greater_than: 0 }, allow_blank: true, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    user_type.name == "Admin"
  end
end
