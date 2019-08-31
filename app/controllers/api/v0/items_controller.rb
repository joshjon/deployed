class Api::V0::ItemsController < ActionController::API
  NEWS_LIMIT = 25

  def index
    @items = Item.all.order('created_at').limit(NEWS_LIMIT).reverse
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(by: params[:username], title: params[:text], url: params[:source], text: params[:text])

    # if statement to handle case sensitive
    if params[:type] == 'News' || params[:type] == 'news'

      @item.type = 'News'

      if @item.save
        render json: { status: 'SUCCESS', message: 'Saved item', data: @item }, status: :ok
      else
        render json: { status: 'ERROR', message: 'items not saved',
                       data: @item.errors }, status: :unprocessable_entity
      end
    # if statement to handle case sensitive
    elsif params[:type] == 'Comment' || params[:type] == 'comment'

      @item.type = 'Comment'

      if @item.save
        render json: { status: 'ok', message: 'Saved item', data: @item }, status: 200

        # create news_comment to join comment to news item
        @news_comment = NewsComment.new(news_id: params[:news_id], comment_id: @item.id)
        @news_comment.save
      else
        render json: { status: 'error', message: 'Item not saved', data: @item }, status: 400
      end
    end
  end

  def jsondata(item)
    {
      time: item.created_at
    }
  end

  private

  def item_params
    params.permit(:username, :text, :source)
  end
    end
