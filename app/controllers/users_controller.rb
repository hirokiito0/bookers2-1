class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def index
    @users = User.all
    @book_new = Book.new
    @user = current_user
    
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render:edit
    end

  end

  def user_params
      params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end
