class UsersController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  
  def new
    @user = User.new
  end
  
  def create

  end

  def show
    @user = User.find(params[:id])
  end

end
