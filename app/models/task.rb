class Task < ActiveRecord::Base
  AVAILABLE_STATUSES = ["new", "in_progress", "done"]
  belongs_to :project
  belongs_to :user
  validates_presence_of :project, :user, :state, :name
  scope :pending, -> { where(:state => "new") }
  scope :in_progress, -> { where(:state => "in_progress") }
  scope :completed, -> { where(:state => "done") }

  def update_state(new_state)
    self.state = new_state
    self.save
  end

  def Task.generate_dev_report
    report = []
    User.developers.each do |dev|
      temp = {}
      temp[:dev] = dev.name
      AVAILABLE_STATUSES.each do |state|
        temp[state] = dev.tasks.where(:state => state).pluck(:name).join("<br />").html_safe
      end
      report << temp
    end
    report
  end

  def Task.generate_project_report
    report = []
    Project.all.each do |project|
      temp = {}
      temp[:project] = project.name
      AVAILABLE_STATUSES.each do |state|
        temp[state] = project.tasks.where(:state => state).pluck(:name).join("<br />").html_safe
      end
      report << temp
    end
    report
  end

  def Task.generate_chart_data
    Task.count(group: "state").to_a
  end
end

