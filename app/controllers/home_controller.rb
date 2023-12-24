class HomeController < ApplicationController
  def home 
    @articles = Article.all.order(id: "DESC")
    @page = "global_feed"
    
  end

  def change_to_global
    @articles = Article.all.order(id: "DESC")
    @page = "global_feed"
    render("home/home")
  end

  def change_to_your
    @articles = Article.where(user_id: @current_user.id).order(id: "DESC")
    @page = "your_feed"
    render("home/home")
  end
end
