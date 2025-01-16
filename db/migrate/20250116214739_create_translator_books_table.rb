class CreateTranslatorBooksTable < ActiveRecord::Migration[7.2]
  def change
    create_table :translator_books do |t|
      t.references :translator, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end

    add_index :translator_books, [ :translator_id, :book_id ], unique: true
  end
end
