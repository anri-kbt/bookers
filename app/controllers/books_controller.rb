class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
  end

  def create
    book=Book.new(book_params)
    book.save
    #保存出来たら、redirect先でflashでサクセスメッセージを出す。
    if book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(book.id)
    else
      render "/books/index"
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params{:id})
  end

  private #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end
end

