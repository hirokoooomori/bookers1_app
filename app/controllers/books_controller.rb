class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book =Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "File has been successfully deleted."
      redirect_to books_path
    end
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
