class UsersController < ApplicationController
before_filter :authenticate_user!
before_filter :admin_user, only: :destroy
  def show
    #@user = User.find(params[:id])
    @user = current_user
    @question = @user.question.paginate(page: params[:page])
    @quest = current_user.question.build if user_signed_in?
  
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def edit
    @user = current_user
  end
  
  def destroy
  @destroy_user = User.find(params[:id])
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end


  private
 
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
