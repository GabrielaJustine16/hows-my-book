class BooksController < ApplicationController
    before_action :find_book, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, only: [:new, :edit, :destroy]
    
    def index
       
        @books=Book.all.ordered_by_title
    end 

    def show
        @book = Book.find(params[:id])
        #binding.pry
    end 

    def new
       @book = current_user.books.build
      @categories = Category.all.map{ |c| [c.name, c.id] }
      @review = @book.reviews.build
      
        
    end 

    def create
        #binding.pry
        
    
        @book=current_user.books.build(book_params)
        @book.user_id = current_user.id
        @book.category_id = params[:category_id]

        if @book.save
            redirect_to root_path
        else
            render 'new'
        end
    end 
    
    def edit
       
        
        
        @categories = Category.all.map{ |c| [c.name,c.id]}
        
        
      
    end 

    def update
        @book.category_id = params[:category_id]
        
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end 
    end 

    def destroy

        
        
         if @book
            @book.destroy
         end 
        
         redirect_to root_path
       
    end 


    private
 
        def book_params
            #params.require(:book).permit(:book_id,:user_id ,:title, :description, :author, :category_id,reviews_attributes: [:rating,:comment,:user_id,:book_id])
            params.require(:book).permit(:title, :description, :author, :category_id,reviews_attributes: [:rating,:comment,:user_id,:book_id])

        end 

        def find_book
            @book=current_user.books.find_by(id: params[:id])
        end

       

     
       
    
end
