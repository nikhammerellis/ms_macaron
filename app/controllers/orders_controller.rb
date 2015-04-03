class OrdersController < ApplicationController
  before_action :authorize, only: [:index, :show, :destroy]
  before_action :logged_in, only: :new

  def authorize 
    redirect_to root_url unless current_user && current_user.admin?
  end

  def logged_in
    redirect_to root_url unless current_user
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = 'Order placed!'
      redirect_to '/' 
    else
      flash[:errors] = @order.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to :back
  end

  private
  def order_params
    params.require(:order).permit(:content, :user_id)
  end
end