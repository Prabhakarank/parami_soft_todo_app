require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "MyString",
      :project_id => 1,
      :user_id => 1,
      :state => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "input#task_project_id[name=?]", "task[project_id]"
      assert_select "input#task_user_id[name=?]", "task[user_id]"
      assert_select "input#task_state[name=?]", "task[state]"
    end
  end
end
