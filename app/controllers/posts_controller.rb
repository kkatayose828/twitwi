class PostsController < ApplicationController
    def index
        @posts = Post.all.order("created_at DESC").page(params[:page]).per(20)
    end
    
    def show
        @post = Post.find_by(id:params[:id])
    end

    def new
    end

    def create
        @post = Post.new(
            title: params[:title],
            content: params[:content],
            user_id: 2
           )
        if @post.save
          redirect_to("/posts/index")
        else
          render("posts/new")
        end

    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to("/posts/index")
    end
  end
end