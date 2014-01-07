class Task < ActiveRecord::Base
  AVAILABLE_STATUSES = ["new", "in_progress", "done"]
  belongs_to :project
  belongs_to :user
  scope :pending, -> { where(:state => "new") }
  scope :in_progress, -> { where(:state => "in_progress") }
  scope :completed, -> { where(:state => "done") }

  def update_state(new_state)
    self.state = new_state
    self.save
  end
end
