class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:update,:edit,:show]

  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if !user_signed_in?
      return  redirect_to new_user_session_path
    elsif current_user.id != @item.user_id
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:price,:explanation,:category_id,:status_id,:deal_fee_id,:prefecture_id,:delivery_period_id,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
