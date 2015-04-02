class MessagesController < ApplicationController
  def index
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

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:blog_id, :user_id, :message)
  end
end
