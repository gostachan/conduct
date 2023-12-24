class ApplicationController < ActionController::Base
  before_action :authenticate_user
  def authenticate_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def login
    if @current_user = User.find_by(email: params[:email], password: params[:password])
      session[:user_id] = @current_user.id
      redirect_to "/"
    else
      flash[:notice] = "The value of email or name is incorrect."
      render("users/login")
    end
    
  end
end
