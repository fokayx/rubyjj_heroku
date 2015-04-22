crumb :root do
  link "Home", root_path
end

crumb :location do |location|
  link location.name, location_hospitals_path(location.id)
  parent :root
end

crumb :hospital do |hospital|
  link hospital.name, exams_path
  parent :location, hospital.location
end

#後台breadcrumb
crumb :tekmqbs do
  link "RubyJJ", dashboard_tekmqbs_hospitals_path
end

crumb :tekmqbs_hospital do |tekmqbs_hospital|
  link tekmqbs_hospital.name, edit_dashboard_tekmqbs_hospital_path(tekmqbs_hospital.id)
  parent :tekmqbs
end

crumb :tekmqbs_exam do |tekmqbs_exam|
  link tekmqbs_exam.name, package_dashboard_tekmqbs_exam_path
  parent :tekmqbs_hospital, tekmqbs_exam.hospital
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
