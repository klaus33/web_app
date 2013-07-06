class AnswersController < ApplicationController
  before_filter :authenticate_user!
  
  def create
   @feed_items = User.first.feea.paginate(page: params[:page]) 
    @answer = current_user.answer.build(params[:answer])
    if @answer.save
      flash[:success] = "Respuesta Enviada!"
      redirect_to root_url
    else
    flash[:success] = "Respuesta NO Enviada!"
      render 'static_pages/home'
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    flash[:success] = "Answer destroyed."
    redirect_to root_url
  end
end


