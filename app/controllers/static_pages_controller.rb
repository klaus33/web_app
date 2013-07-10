class StaticPagesController < ApplicationController
  def home
   @question = Question 
   if not User.first.nil?
      @feed_items = User.first.feed.paginate(page: params[:page]) 
   else
      @feed_items = []
   end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
