class NewsController < ApplicationController
  # ensures that only logged in users can access the page to create a new link
  before_action :prevent_unauthorized_user_access, only: [:new]
  before_action :set_page, only: [:index]

  NEWS_PER_PAGE = 10

  def index
    @news = News.limit(NEWS_PER_PAGE).offset(@page * NEWS_PER_PAGE)
  end

  def set_page
    @page = params[:page].to_i || 0
    @pageNum = @page + 1
  end

  def create
    @news = News.new(type: 'News', by: current_user.username,
                     title: news_params[:title], url: news_params[:url])
    flash[:success] = 'Welcome to Deployed!' if @news.errors.any?

    if @news.save
      redirect_to root_path, notice: 'Post successfully created'
    else
      render :new
    end
  end

  def new
    @news = News.new
  end

  def show
    @news = News.find_by(id: params[:id])
    @comments = @news.comments.order(created_at: :desc)
  end

  def news_params
    params.require(:news).permit(:title, :url)
  end
end
