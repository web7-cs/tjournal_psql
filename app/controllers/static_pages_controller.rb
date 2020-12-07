class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @teaching_idea  = current_user.teaching_ideas.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def team
  end

end
