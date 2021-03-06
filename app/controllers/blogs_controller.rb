class BlogsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :authorize, only: [:new, :edit, :destroy]

  def authorize 
    redirect_to root_url unless current_user && current_user.admin?
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @message = Message.new
    @messages = Message.all 
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def new
    @blog = Blog.new 
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save 
      flash[:success] = "Blog entry posted!"
      redirect_to '/'
    else
      flash[:errors] = @blog.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update( blog_params )
      flash[:success] = "Blog Entry Updated"
      redirect_to '/'
    else
      flash[:errors] = @blog.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Blog.find(params[:id]).destroy 
    redirect_to '/'
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end
end
