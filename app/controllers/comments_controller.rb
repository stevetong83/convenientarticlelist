class CommentsController < ApplicationController

  def create
    @site = Site.find params[:site_id]
    @comment = @site.comments.build params[:comment]
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find params[:site_id]
    @comment.destroy
    redirect_to root_path
  end

end
