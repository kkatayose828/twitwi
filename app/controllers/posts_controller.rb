class PostsController < ApplicationController
  before_action :authenicate_user
  
    def index
      @posts = Post.all.order("created_at DESC").page(params[:page]).per(20)
    end
    
    def show
      @post = Post.find_by(id: params[:id])
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(
          title: params[:title],
          content: params[:content],
          user_id: session[:user_id]
          )
      if @post.save
          flash[:notice] = "スレッドを作成しました"
          redirect_to("/posts/index")
      else
          render("posts/new")
      end
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "スレッドを削除しました"
      redirect_to("/posts/index")
    end
end