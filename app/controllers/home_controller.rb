class HomeController < ApplicationController
  def developer
    @new_tasks = current_user.tasks.pending
    @in_progress_tasks = current_user.tasks.in_progress
    @completed_tasks = current_user.tasks.completed
  end

  def admin
  end
end
