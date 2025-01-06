class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc
      t.integer :rating

      t.timestamps
    end
  end
end
