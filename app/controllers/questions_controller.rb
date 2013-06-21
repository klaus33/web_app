class QuestionsController < ApplicationController

  def index
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
