class CommentsController < ApplicationController
    before_action :authenicate_user

    def new
        @comment = Comment.new(params[:post_id])
    end
    
    def create
        @comment = Comment.new(
            content: params[:content],
            post_id: params[:post],
            user_id: @current_user.id
            )
        if @comment.save
            flash[:notice] = "コメントを投稿しました"
            redirect_to("/posts/#{@post.id}")
        else
            render("comments/new")
        end
      end
end
