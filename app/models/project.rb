class Project < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :users

  validates_presence_of :users, :name
  def get_users
    users.pluck(:email).join(",")
  end

  def to_s
    name
  end
end
