class CreateMainTables < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.text :annotation
      t.bigint :cover_image_id
      t.date :year
      t.string :lang
      t.string :original_lang
      t.integer :pages
      t.boolean :read, default: false
      t.bigint :author_id
      t.bigint :publisher_id
      t.bigint :translator_id
      t.string :media_type
      t.integer :rating, default: 0
      t.integer :price, default: 0

      t.timestamps
    end

    create_table :user do |t|
      t.string :full_name
      t.string :alias

      t.timestamps
    end

    create_table :reading_progress do |t|
      t.references :user, null: false
      t.references :book, null: false
      t.integer :page
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    %i[authors publishers translators].each do |table_name|
      create_table table_name do |t|
        t.string :name
        t.text :description
        t.bigint :image_id

        t.timestamps
      end
    end

    create_table :reviews do |t|
      t.string :title
      t.text :summary
      t.integer :rating
      t.boolean :new_author, default: true

      t.references :book, null: false
      t.references :user, null: false

      t.timestamps
    end

    create_table :genres do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
