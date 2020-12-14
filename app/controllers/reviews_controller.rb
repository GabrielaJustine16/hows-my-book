class ReviewsController < ApplicationController
    before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]


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
        @review = @book.reviews.build

    end 



    def create
        @review = current_user.reviews.build(review_params)
       

        
        if @review.save
            redirect_to book_path(@book)
        else
           
            render 'new'
        end
    end 

    def edit

    end 

    def update
        @review = Review.find(params[:id])

        #make it the users reviews so everyone cant see. if not, send away

        if @review.update(review_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end 
    end 

    def destroy
        @review.destroy 
        redirect_to book_path(@book)
    end 

    private

    def review_params
        params.require(:review).permit(:rating, :comment, :book_id, :user_id)
        #params.require(:review).permit(:rating, :comment)
    end 

    def find_book
        @book = Book.find_by(id: [params[:id], params[:book_id]])
         
    end 

    def find_review
        @review = Review.find(params[:id])
    end 
end
