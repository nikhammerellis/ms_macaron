class MessagesController < ApplicationController
  before_action :authorize, only: [:index, :show]

  def authorize 
    redirect_to root_url unless current_user && current_user.admin?
  end

  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def create
  	@message = Message.new(message_params)
  	if @message.save 
  		flash[:success] = "Comment posted!"
      	redirect_to :back
    else 
    	flash[:errors] = @message.errors.full_messages
    	redirect_to :back
    end 
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to :back
  end

  private
  def message_params
    params.require(:message).permit(:blog_id, :user_id, :message)
  end
end
