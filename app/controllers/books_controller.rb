class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Save completed"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render action: :index
    end
  end

  def show
    @book =Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Update completed"
      redirect_to books_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "File has been successfully deleted"
      redirect_to books_path
    else
      render action: :index
    end
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
