class CommentsController < ApplicationController
    before_action :authenicate_user

    def new
        @post = Post.find_by(id: params[:id])
        #comment = Comment.new(post: params[:post_id])
        @comment = @post.comments.build
    end
    
    def create
        @post = Post.find_by(id: params[:id])
        @comment = @post.comments.build(
            content: params[:content],
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
