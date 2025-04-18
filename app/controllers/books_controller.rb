class BooksController < ApplicationController

  def show
    @a_book = Book.find(params[:id])
    @book = Book.new
    @user = @a_book.user
    @comment = BookComment.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to request.referer, notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless  @book.user == current_user
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    unless  @book.user == current_user
    redirect_to books_path
    end
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to request.referer
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
