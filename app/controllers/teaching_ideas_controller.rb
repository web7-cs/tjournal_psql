class TeachingIdeasController < ApplicationController
    # before_action :set_user
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    # before_action :set_user

    def new
        @teaching_idea = current_user.teaching_ideas.build
    end
    
    def create
        # @teaching_idea = current_user.teaching_ideas.build(teaching_idea_params)
        @teaching_idea = current_user.teaching_ideas.new(teaching_idea_params)
        @teaching_idea.image.attach(params[:teaching_idea][:image])
        if @teaching_idea.save
            flash[:success] = "teaching_idea created!"
            redirect_to root_url
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'static_pages/home'
        end
    end

    def destroy
        @teaching_idea.destroy
        flash[:success] = "teaching_idea deleted"
        if request.referrer.nil? || request.referrer == teaching_ideas_url
            redirect_to root_url
        else
            redirect_to request.referrer
        end
    end

  private

    # def set_user
    #     @teaching_idea = current_user.id
    # end    

    def set_user
        # @user = User.find(params[:user_id])
    end

    def teaching_idea_params
      params.require(:teaching_idea).permit(:content, :image,:user_id)
    end



    def correct_user
      @teaching_idea = current_user.teaching_ideas.find_by(id: params[:id])
      redirect_to root_url if @teaching_idea.nil?
    end

end
