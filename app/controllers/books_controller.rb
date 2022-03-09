class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
  end

  def create
    @book=Book.new(book_params)
    @books=Book.all
    #book.save
    #保存出来たら、redirect先でflashでサクセスメッセージを出す。
    if @book.save
      redirect_to book_path(@book.id), notice:"Book was successfully created."
    else
      render :index
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    if @book.update
      redirect_to book_path(@book.id),notice:"Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    #リダイレクトと同時にフラッシュメッセージを表示
    redirect_to books_path(book.id),alert:'Book was successfully destroyed.'
  end

  private #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end
end


