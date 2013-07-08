class QuestionsController < ApplicationController

  def index
  end
  
  def reply
    @feed_items = User.first.feea.paginate(page: params[:page]) 
    @question = Question.find(params[:id])
    @user = current_user
    @answer = @user.answer.paginate(page: params[:page])
    @quest = current_user.answer.build if user_signed_in?
    @comment_list= Comment.all
    @cont = Comment.new if user_signed_in?
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
  
  def accept
  
  flash[:success] = "Ha aceptado una respuesta!"
    @answer = Answer.find(params[:id])
    @answer.correct = true
    @answer.save
    @question = Question.find(params[:format])
    @question.answered = true
    @question.save
    redirect_to :back
  end
  
  def upvote
  flash[:success] = "Ha votado por una respuesta!"
    @answer = Answer.find(params[:id])
    @answer.liked_by current_user
    @answer.save
    redirect_to :back
  end
  
  def downvote
  flash[:success] = "Ha votado por una respuesta!"
    @answer = Answer.find(params[:id])
    @answer.downvote_from current_user
    @answer.save
    redirect_to :back
  end
  
end
