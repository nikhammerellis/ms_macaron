class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
  		flash[:error] = 'Invalid Login Credentials'
  		#if there is an error, redirect back to login
  		redirect_to :back
  	else 
  		sign_in user
  		flash[:login_success] = 'Welcome, '
  		redirect_to '/'
  	end
  end

  def destroy
  	sign_out
  	redirect_to '/'
  end
end
