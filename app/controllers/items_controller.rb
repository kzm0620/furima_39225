class ItemsController < ApplicationController
 
  #before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]

<<<<<<< Updated upstream
=======
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,             only: [:edit, :update, :show, :destroy] 
>>>>>>> Stashed changes

  def index
    @item = Item.all.order(created_at: :desc)
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
    params.require(:item).permit(:image, :category_id, :item_name, :item_explanation, :item_situation_id, :item_price, :shipping_charge_id, :days_to_delivery_id, :prefecture_id).merge(user_id: current_user.id)
  end

<<<<<<< Updated upstream
  # def set_item
  #   @item = Item.find(params[:id])
  # end
=======
 
>>>>>>> Stashed changes


end
