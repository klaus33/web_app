class UsersController < ApplicationController
  def show
    #@user = User.find(params[:id])
    @user = current_user
    @question = @user.question.paginate(page: params[:page])
    @quest = current_user.question.build if user_signed_in?
  end
  
  def edit
    @user = current_user
  end
  
end
