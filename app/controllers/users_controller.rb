class UsersController < ApplicationController
  def show 
    @user = User.find_by(id: params[:id])
    @articles = Article.where(user_id: params[:id]).order(id: "DESC")
  end

  def login

  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def new
    
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/")
    else
      flash[:notice] = "エラーが発生しました"
      render("users/new")
    end
  end
end
