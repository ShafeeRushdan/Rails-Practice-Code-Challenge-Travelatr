class BloggersController < ApplicationController

    def new 
        @blogger = Blogger.new
    end

    def show
        set_blogger
    end

    def create
        blogger = Blogger.create(blogger_params)
        
        if blogger.valid? 
            redirect_to blogger_path(blogger)
        else 
            flash[:errors] = blogger.errors.full_messages
            flash[:note] = "Try again!"
            redirect_to new_blogger_path
        end
    end


    private

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end
    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end
