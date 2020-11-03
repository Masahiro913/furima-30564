class DealsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :item_info, only: [:new, :create]
  before_action :rejection_to_enter, only: [:new]



  def new
    @dealAddress = DealAddressForm.new
  end

  def create
    @dealAddress = DealAddressForm.new(deal_params)
    if @dealAddress.valid?
      payment
      @dealAddress.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def deal_params
    params.require(:deal_address_form).permit(:post_number, :prefecture_id, :city_town, :addressline, :building_name, :tell_buyer).merge(user_id: current_user.id).merge(item_id: @item.id, token: params[:token])
  end

  def item_info
    @item = Item.find(params[:item_id])
  end

  def payment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: item_info[:price],
        card: deal_params[:token],
        currency: 'jpy'
      )
  end

  def rejection_to_enter
    if @item.deal.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
        redirect_to root_path
    end
  end
end