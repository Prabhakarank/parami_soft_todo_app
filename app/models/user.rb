class User < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :create_role

  def create_role
    self.roles = "developer" if self.roles.nil?
  end

  def User.developers
    where(:roles => "developer")
  end

  def admin?
    roles == 'admin'
  end

  def name
    email
  end

  def to_s
    email
  end
end
