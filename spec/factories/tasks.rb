# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    project_id 1
    user_id 1
    state "MyString"
  end
end
