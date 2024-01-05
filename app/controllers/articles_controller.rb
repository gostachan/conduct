class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
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
    data = params[:article]
    article = Article.new(
      user_id: 1,
      title: data[:title],
      description: data[:description],
      content: data[:content])
    if article.save
      render status: 200, json: {article: article}
    else
      render json: {status: "fail"}
    end
  end
 
  def api_update
    data = params[:article]
    article = Article.find(params[:slug])
    article.title = data[:title] if data[:title]
    article.content = data[:content] if data[:content]
    article.description = data[:description] if data[:description]
    article.save
    render json: {article: article}, status: :created
  end
 
  def api_destroy
    article = Article.find(params[:slug])
    article.destroy
  end
 
end