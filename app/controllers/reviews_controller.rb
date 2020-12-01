class ReviewsController < ApplicationController
    before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

    #before_action :find_book

    #we want access to @book instace variable in all of our views so were going to adda before action
    
    def new
        @review = Review.new
    end 


    def create
        @review = Review.new(review_params)
        #we want to assosiate review with current user and current book
         @review.book_id = @book.id 
         @review.user_id = current_user.id
         #set book id atribute to current
        if @review.save
            redirect_to book_path(@book)
        else
            render 'new'
        
        end
    end 

    def edit
        #@review = Review.find(params[:id])

    end 

    def update
        @review = Review.find(params[:id])

        if @review.update(review_params)
            redirect_to book_path(@book)
        else
            render 'edit'
    end 

    private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end 

    def find_book
        @book = Book.find(params[:book_id])
         
    end 

    def find_review
        @review = Review.find(params[:id])
    end 
    #review is assoisiated with book_id which is why we use it instead of :id
end
