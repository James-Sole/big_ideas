class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    render layout:"login_reg"
  end
  def show
    @user ||= User.find(params[:id])
    render layout:"login_reg"
  end
  
  def edit
  end
  def create
    if new_user.valid?
      session[:user_id]= new_user.id
      return redirect_to bright_ideas_path
    end

    redirect_to :back, alert: new_user.errors.full_messages
  end
  private
    helper_method def user
      @user ||= User.find(params[:id])
    end
    helper_method def new_user
      @new_user ||= User.create(user_params)
    end

    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end
