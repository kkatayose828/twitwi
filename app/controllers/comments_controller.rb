class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end
    
    def create
        @post = Post.find_by(params[:post_id])
        @comment = post.comments.create(comment_params)
        @comment.user_id = current.user_id
        if @comment.save
            flash[:succcess] = "コメントしました"
            redirect_to post_path(@post)
        else
            flash[:success] = "コメント失敗しました"
            redirect_to post_path(@post)
        end
    end
end
