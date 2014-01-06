class Project < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :developers, -> { where roles: 'developer' }, class_name: 'User'
  accepts_nested_attributes_for :developers
end
