class BooksController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if params[:tag]
      @books = Book.tagged_with(params[:tag])
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
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
    params.require(:book).permit(:title, :description, :content, :book_cover, :tag_list)
  end
end
