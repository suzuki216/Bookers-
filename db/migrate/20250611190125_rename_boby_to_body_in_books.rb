class RenameBobyToBodyInBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :boby, :body
  end
end
