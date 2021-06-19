class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @books = Book.all
      @user = current_user
      render:index
    end 
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def index
    @book_new = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @user = @book.user
    @book_new = Book.new

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render:edit
    end
    
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
