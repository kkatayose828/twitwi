class PostsController < ApplicationController
    before_action :ensure_correct_user,{only: [:destroy]}
    before_action :set_current_user
    def index
      @posts = Post.all.order("created_at DESC").page(params[:page]).per(20)
    end
    
    def show
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)
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

    def ensure_correct_user
      @post = Post.find_by(id: params[:id])
      if @post.user_id != session[:user_id]
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
      end
    end

    def set_current_user
      session[:user_id] = 3
    end
end