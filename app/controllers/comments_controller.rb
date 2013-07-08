class CommentsController < ApplicationController
  def create
 
    @comment = Comment.new(params[:comment])

    if @comment.save
    flash[:success] = "Comentario Agregado!"
      redirect_to :back
    else
      render 'static_pages/home'
    end

  end
end
