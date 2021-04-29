class StoriesController < ApplicationController
before_action :set_story, only: [:show, :edit, :update, :destroy]

    def index
        @stories = Story.all
    end

    def show
        @stories = Story.all
    end

    def new
        @story = current_user.stories.build
        
    end

    def edit
        @user = User.where(user_id: params[:id])
    end

    def create 
        @story = Story.new(story_params)
        @story.user = helpers.current_user #aca le indico al usuario de la historia es igual al usuario current user
        respond_to do |format|
            if @story.save
                format.html { redirect_to @story, notice: 'Story was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def update
        respond_to do |format|
            if @story.update(story_params)
                format.html { redirect_to @story, notice: "Story was successfully updated." }
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @story.destroy
        respond_to do |format|
          format.html { redirect_to stories_url, notice: "Story was successfully destroyed." }
        end
    end
    
    private
    # Only allow a list of trusted parameters through.
    def set_story
        @story = Story.find(params[:id])
    end
    
    def story_params
      params.require(:story).permit(:title, :picture, :content)
    end
end