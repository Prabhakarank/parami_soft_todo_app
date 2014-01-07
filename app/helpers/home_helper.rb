module HomeHelper
  def get_action_link(task)
    case task.state
    when "new"
      link_to "In Progress", update_state_task_path(task, :state => "in_progress"), :class => [:btn, :"btn-primary"]
    when "in_progress"
      link_to "Done", update_state_task_path(task, :state => "done"), :class => [:btn, :"btn-success"]
    else
      link_to "Completed", "#", :class => "btn btn-default"
    end
  end
end
