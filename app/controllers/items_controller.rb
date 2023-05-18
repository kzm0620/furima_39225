class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,             only: [:edit, :update, :show, :destroy] 


  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end  




  private

  def item_params
    params.require(:item).permit(:image, :category_id, :item_name, :item_explanation, :item_situation_id, :item_price, :shipping_charge_id, :delivery_id, :prefecture_id).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

end
