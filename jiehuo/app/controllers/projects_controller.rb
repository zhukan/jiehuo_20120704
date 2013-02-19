class ProjectsController < ApplicationController
  def index
    @hot_ask_rank = hot_ask_rank
    @person = Person.new(current_user.id)
    @domains = Domain.all
  end

  def follow
    @followed_project = FollowedProject.new
    @followed_project.user_id = current_user.id
    @followed_project.project_id = params[:id]
    state = @followed_project.save

    if state.eql?(false)
      @error = @followed_project.errors
    end

    respond_to do |format|
      format.js
    end
  end

  def unfollow
    @state = nil
    @followed_project = FollowedProject.first(:conditions => ["user_id=? and project_id=?", current_user.id, params[:id]])
    @state = @followed_project.destroy

    respond_to do |format|
      format.js
    end
  end

end
