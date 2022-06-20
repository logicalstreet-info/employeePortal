namespace :employee_portal do
  desc "a new task to be executed"
  task :count_leave => "environment" do
    org = Organization.all
    org.each do |organization|
      Organization.calculated_lefted_leaves_of_the_month(organization)
    end
  end
end
