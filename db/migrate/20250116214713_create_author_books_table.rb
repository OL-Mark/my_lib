class CreateAuthorBooksTable < ActiveRecord::Migration[7.2]
  def change
    create_table :author_books do |t|
      t.references :author, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end

    add_index :author_books, [ :author_id, :book_id ], unique: true
  end
end
