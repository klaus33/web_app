class QuestionsController < ApplicationController

  def index
  end
  
  def reply
    @feed_items = User.first.feea.paginate(page: params[:page]) 
    @question = Question.find(params[:id])
    @user = current_user
    @answer = @user.answer.paginate(page: params[:page])
    @quest = current_user.answer.build if user_signed_in?
  end
  
  def create
  @question = current_user.question.build(params[:question])
    if @question.save
      flash[:success] = "Pregunta Creada!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question destroyed."
    redirect_to root_url
  end
end
