class MediaItemsController < ApplicationController
  before_filter :set_media_item, only: [:edit, :update]

  def index
    @media_items = MediaRepository.visible_for(current_user)
  end

  def new
    @media_item = MediaItem.new
  end

  def edit
  end

  def create
    @media_item = AddToMediaCollection.new(media_item_params.merge(user: current_user)).execute!
    if @media_item.valid?
      redirect_to media_items_path
    else
      render "new"
    end
  end

  def update
    if @media_item.user == current_user
      ChangeItemVisibility.new(media_item: @media_item, public: params[:media_item][:public]).execute!
    end
    redirect_to media_items_path
  end

  private
    def media_item_params
      params.require(:media_item).permit(:url, :public)
    end

    def set_media_item
      @media_item = MediaRepository.find(params[:id])
    end
end
