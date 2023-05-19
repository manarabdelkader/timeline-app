class ReviewsController < ApplicationController
    def create
      post = Post.find(params[:post_id])
      review = post.reviews.create(review_params)
      render json: { message: 'Review added successfully' }
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end