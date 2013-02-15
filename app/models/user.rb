class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  acts_as_paranoid         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :login, :first_name, :last_name, :password, :password_confirmation, :remember_me
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  validates_presence_of :username, :case_sensitive => false
  validates_uniqueness_of :username
  validates_format_of :username, :with => /^[\w_]+$/

  has_many :videos

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end



end
