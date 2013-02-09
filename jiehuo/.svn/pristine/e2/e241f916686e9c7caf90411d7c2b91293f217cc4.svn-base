# coding: UTF-8
module ProjectsHelper

  def input_hidden_project_detail(project)
    follower = FollowedProject.count(:conditions => ["project_id=?",project.project_id])
    follow_state = FollowedProject.exists?(:user_id=>current_user.id, :project_id=>project.project_id)
    project.description = "该学科还没有添加介绍" if project.description==""
    raw "<input type=\"hidden\" intrduce=\"#{project.description}\" followers=\"#{follower}\" follow_state=\"#{follow_state}\">"
  end

end
