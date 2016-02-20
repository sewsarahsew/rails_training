class ArticlesController < ApplicationController
include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Blog post #'#{@article.title}' created. i have just 1 question. why?"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' has been destroyed! humanity thanks you."

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])

  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

flash.notice = "Article '#{@article.title}' is updated! im sure your mom is really proud."

    redirect_to article_path(@article)
  end
end
