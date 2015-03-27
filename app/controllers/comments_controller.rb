class CommentsController < ApplicationController
  before_action :authenticate_user!, { only: [:create, :edit, :update, :destroy]}

  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment submitted"
      redirect_to blog_path(@comment.blog)
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Your comment has been deleted"
    else
      flash[:error] = "There was an error when deleting"
    end
    redirect_to blog_path(@blog)
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Your comment has been changed successfully"
      redirect_to blog_path(@blog)
    else
      flash[:error] = "There was an error with your edit"
      render action: :edit
    end
  end

private
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
