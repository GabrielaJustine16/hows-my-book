class BooksController < ApplicationController

    def index
        @books=Book.all.order("created_at DESC")
    end 
    #will be listed in descending order

    def new
        @book= Book.new 
        #use instance varialbe in views
    end 

    def create
        @book=Book.new(book_params)

        if @book.save
            redirect_to root_path
        else
            render 'new'
        end
    end 
    #instead of making a create.html page, we will have this redirect to the root path when the create button is hit. in rake routes, root is the path to the index page which is the home page

    private
 
        def book_params
            params.require(:book).permit(:title, :description, :author)
        end 
end
