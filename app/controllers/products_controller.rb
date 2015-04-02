class ProductsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :destroy]

  def authorize 
    redirect_to root_url unless current_user && current_user.admin?
  end

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
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
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
