class AuthorsController < ApplicationController
    def index
      @authors = Author.all
    end
    
    def show
      @author = Author.find(params[:id])
    end
    
    def new
        @author = Author.new
    end

    def create
        Author.create(author_params)
        render :new
    end

    private
    def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end