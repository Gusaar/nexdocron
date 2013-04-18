class User < ActiveRecord::Base
  belongs_to :user_type

  has_many :hours
  has_many :projects, through: :user_projects

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :skype_id, :phone, :mobile, :rate

  validates :username, :uniqueness => { :allow_blank => true, :allow_nil => true }

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    user_type.name == "Admin"
  end
end
