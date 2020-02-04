class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index_all, :show]
  before_action :find_article, only: [:show, :edit, :update, :delete]
  def index
    @articles = Article.where(user: params[:user_id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    user = User.find(params[:user_id])
    @article.user = user

    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article.update(params_article)
    if @article.save
      redirect_to user_article_path(current_user, @article)
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to user_path(current_user)
  end

  def index_all

    @articles = Article.all
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :content, :user_id, :location, :photo, :date)
  end
end
