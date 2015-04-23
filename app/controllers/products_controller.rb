class ProductsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def authorize 
    redirect_to root_url unless current_user && current_user.admin?
  end

  def index
    @products = Product.all.order(created_at: :desc)
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def show
    @product = Product.find(params[:id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      flash[:success] = "New product listed"
      redirect_to '/'
    else
      flash[:errors] = @product.errors.full_messages 
      redirect_to :back
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update( product_params )
      flash[:success] = "Product Updated"
      redirect_to '/'
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Product.find(params[:id]).destroy 
    redirect_to '/products/index'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
