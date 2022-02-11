class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    @book.save
    redirect_to about_path
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.all
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
