class PostsController < ApplicationController
    def index
        @posts = Post.all.order("created_at DESC").page(params[:page].per(4)
        @posts = Post.all.limit(5)
    end
    
    def show
        @post = Post.find_by(id:params[:id])
    end

    def new
    end

end