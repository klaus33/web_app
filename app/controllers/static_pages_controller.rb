class StaticPagesController < ApplicationController
  def home
   @question = Question if user_signed_in?
   @feed_items = current_user.feed.paginate(page: params[:page]) if user_signed_in?
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
