class BooksController < ApplicationController
  def new
    @book = Book.new # モデルのインスタンス作成
  end

  def create
    @book = Book.new(book_params) # モデルにフォーム内容を渡す
    if @book.save                    # モデル経由でデータベースに保存
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @books = Book.all # モデルを使って前レコードを取得
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
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
