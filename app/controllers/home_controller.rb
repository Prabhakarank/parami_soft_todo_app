class HomeController < ApplicationController
  def developer
    @new_tasks = current_user.tasks.pending
    @in_progress_tasks = current_user.tasks.in_progress
    @completed_tasks = current_user.tasks.completed
  end

  def admin
    unless current_user.admin?
      redirect_to root_url, :notice => "You are not allowed to access this page"
    end
    @dev_report = Task.generate_dev_report
    @proj_report = Task.generate_project_report
    @get_chart_data = Task.generate_chart_data
  end
end

