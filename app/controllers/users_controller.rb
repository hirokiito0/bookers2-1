class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    before_action :logged_in_user, only: [:index, :edit, :update]
  　before_action :correct_user,   only: [:edit, :update]
    @post_images = @user.post_images.page(params[:page]).reverse_order
    
  end
  
  def index
    @users = User.all
    
  end
  
  def user_params_update
      params.require(:user).permit(:name, :email, :image, :introduction) 
  end
  
end
