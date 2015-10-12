class MediaItemsController < ApplicationController

  def index
    @media_items = MediaRepository.visible_for(current_user)
  end

  # GET /media_items/1
  # GET /media_items/1.json
  def show
  end

  # GET /media_items/new
  def new
    @media_item = MediaItem.new
  end

  # GET /media_items/1/edit
  def edit
  end

  # POST /media_items
  # POST /media_items.json
  def create
    @media_item = AddToMediaCollection.new(media_item_params.merge(user: current_user)).execute!
    if @media_item.valid?
      redirect_to media_items_path
    else
      render "new"
    end
  end

  private
    def media_item_params
      params.require(:media_item).permit(:url, :type)
    end
end
