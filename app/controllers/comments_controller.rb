class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new
  end

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    if @comment.save
      redirect_to book_path(@comment.book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to book_path(@comment.book)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to book_path(@comment.book)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
