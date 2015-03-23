class BlogsController < ApplicationController
  before_action :authenticate_user!, { only: [:create, :edit, :update, :destroy]}
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Blog created successfully"
      redirect_to blogs_path
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice] = "Blog updated successfully"
      redirect_to blogs_path
    else
      flash[:error] = "There was an error when updating your blog"
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "Your blog has been deleted"
    redirect_to blogs_path
  end

private
  def blog_params
    params.require(:blog).permit(:title, :body, :date)
  end
end
