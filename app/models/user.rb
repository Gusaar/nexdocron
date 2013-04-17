class User < ActiveRecord::Base
  belongs_to :user_type

  has_many :hours

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates :username, :uniqueness => { :allow_blank => true, :allow_nil => true }
end
