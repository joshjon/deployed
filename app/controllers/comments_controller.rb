class CommentsController < ApplicationController
  MAX_COMMENTS = 10
  def index
    @news_comment = NewsComment.limit(MAX_COMMENTS)
    @comments = Comment.all
    @news = News.all
  end

  def create
    @news = News.find_by(id: params[:news_id])
    @comment = Comment.new(type: 'Comment', by: current_user.username,
                           text: comment_params[:text])
    if @comment.save
      @news_comment = NewsComment.new(news_id: @news.id, comment_id: @comment.id)
      @news_comment.save
      redirect_to request.referrer, notice: 'Comment successfully created'
    else
      redirect_to @news, notice: 'Comment not saved. Comments should be between 3 and 1000 characters long.'
    end
end

  private def comment_params
    params.require(:comment).permit(:text)
  end
end
