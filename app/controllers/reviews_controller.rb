class ReviewsController < ApplicationController
    before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

    #before_action :find_book

    #we want access to @book instace variable in all of our views so were going to adda before action
    def index
        if params[:book_id]
          @books = Book.find(params[:book_id]).reviews
        else
          @reviews = Review.alpha
        end
      end
     
      def show
        @review = Review.find(params[:id])
      end
    def new
        @review = Review.new
        @review.build_book

        #@review = Review.find_by(id: params[:id])
        #@review = Review.new
        #@review.build_review
        
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
    end 

    def destroy
        @review.destroy 
        redirect_to book_path(@book)
    #we have the review already in the before action at the top
    end 

    private

    def review_params
        params.require(:review).permit(:rating, :comment, book_attributes: [:title,:author,:description])
    end 

    def find_book
        #@book = Book.find(params[:book_id])
        @book = Book.find_by(id: [params[:id], params[:book_id]])
         
    end 

    def find_review
        @review = Review.find(params[:id])
    end 
    #review is assoisiated with book_id which is why we use it instead of :id
end
