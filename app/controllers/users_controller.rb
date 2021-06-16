class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @books = @user.books.page(params[:page]).reverse_order
    # before_action :logged_in_user, only: [:index, :edit, :update]
    # before_action :correct_user,   only: [:edit, :update]
    # @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def index
    @users = User.all
    @book_new = Book.new
    @user = current_user
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def user_params
      params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end
