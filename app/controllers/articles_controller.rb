class ArticlesController < ApplicationController
  def show
    @article = Article.find_by(id: params[:id])
    @user = User.find_by(id: @article.user_id)
  end

  def new

  end

  def create
    article = Article.new(title: params[:title], description: params[:description], content: params[:content], user_id: @current_user.id)
    if article.save
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def edit 
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.title = params[:title]
    @article.description = params[:description]
    @article.content = params[:content]
    if @article.save
      redirect_to("/articles/#{params[:id]}")
    else
      render("articles/edit")
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @user = User.find_by(id: @article.user_id)
    @article.destroy
    redirect_to("/users/#{@user.id}")
  end

  def api_index
    articles = Article.where(user_id: params[:slug])
    render status: 200, json: {articles: articles}
  end

  def api_create
    render status: 200, json: {status: "success"}
  end
 
  def api_update
    render status: 200, json: {status: "success"}
  end
  
  def api_destroy
    render status: 200, json: {status: "success"}
  end
 
end