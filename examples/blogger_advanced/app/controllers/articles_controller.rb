class ArticlesController < ApplicationController
  def show
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Article was not found, please try again."
      redirect_to articles_path
    end
  end

  def index
    @articles, @tag = Article.search_by_tag_name(params[:tag])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Article was created."
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to articles_path
  end
end