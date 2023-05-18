class UsersController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  
  def new
    @user = User.new
  end
  
  def create

  end

  def show
<<<<<<< Updated upstream
   
=======
  
>>>>>>> Stashed changes
  end

end
