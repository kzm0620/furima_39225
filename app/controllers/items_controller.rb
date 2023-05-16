class ItemsController < ApplicationController
 
  #before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]


  def index
  
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




  private

  def item_params
    params.require(:item).permit(:item_image, :category_id, :item_name, :item_explanation, :item_situation_id, :item_price, :shipping_charge_id, :days_to_delivery_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
