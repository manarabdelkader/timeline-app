class PostsController < ApplicationController
    def create
      post = Post.create(post_params)
      render json: { message: 'Post created successfully' }
    end
  
    def index
      posts = Post.all
      render json: posts
    end
  
    def top
      posts = Post.joins(:reviews).group('posts.id').order('avg(reviews.rating) DESC')
      render json: posts
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end