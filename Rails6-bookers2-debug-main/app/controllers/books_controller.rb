class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      redirect_to book_path(@book_new), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book_new = Book.new(book_params)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new(book_params)
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
