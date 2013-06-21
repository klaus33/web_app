class StaticPagesController < ApplicationController
  def home
   @question = Question 
   @feed_items = User.first.feed.paginate(page: params[:page]) 
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
