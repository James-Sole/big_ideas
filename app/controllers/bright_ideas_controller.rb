class BrightIdeasController < ApplicationController

  def new
  end

  def show
    @user ||= User.find(session[:user_id])
    @users ||= Like.includes(:user).where(idea_id:params[:id])
    render layout:"login_reg"
  end

  def index
    @user ||= User.find(session[:user_id])
    @ideas ||= Idea.includes(:user)
    render layout:"login_reg"
  end

  def create
    #puts "this is the create method"
    @new_idea ||= Idea.create(user_id:session[:user_id], content:params[:content])
    if @new_idea.valid?
      return redirect_to bright_ideas_path
    else
    return redirect_to bright_ideas_path, alert: @new_idea.errors.full_messages
    end
  end

end
