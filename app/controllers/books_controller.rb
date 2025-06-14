class BooksController < ApplicationController
  def new
    @book = Book.new # モデルのインスタンス作成
  end

  def create
    @book = Book.new(book_params) # モデルにフォーム内容を渡す
    @books = Book.all
    if @book.save                 # モデル経由でデータベースに保存
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all # モデルを使って前レコードを取得
    @book = Book.new # フォーム用の新規インスタンス
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
# Bookというモデルクラスを通してデータベースとやり取りしている
# モデルの定義はapp/models/book.rbに定義されてる
# アクション設定
# モデルはデータの設計図であり、データベースとやりとりする窓口
