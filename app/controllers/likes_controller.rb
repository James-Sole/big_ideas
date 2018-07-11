class LikesController < ApplicationController
  def create
    @like ||= Like.create(user_id:params[:user_id], idea_id:params[:idea_id])
    return redirect_to bright_ideas_path
  end
end
