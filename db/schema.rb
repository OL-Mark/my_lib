# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_16_214739) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "author_books", force: :cascade do |t|
    t.integer "author_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "book_id"], name: "index_author_books_on_author_id_and_book_id", unique: true
    t.index ["author_id"], name: "index_author_books_on_author_id"
    t.index ["book_id"], name: "index_author_books_on_book_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "isbn"
    t.text "annotation"
    t.bigint "cover_image_id"
    t.date "published_at"
    t.string "lang"
    t.string "original_lang"
    t.integer "pages"
    t.boolean "read", default: false
    t.bigint "author_id"
    t.bigint "publisher_id"
    t.bigint "translator_id"
    t.string "media_type"
    t.integer "rating", default: 0
    t.integer "price", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reading_progress", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.integer "page"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reading_progress_on_book_id"
    t.index ["user_id"], name: "index_reading_progress_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.integer "rating"
    t.boolean "new_author", default: true
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "translator_books", force: :cascade do |t|
    t.integer "translator_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_translator_books_on_book_id"
    t.index ["translator_id", "book_id"], name: "index_translator_books_on_translator_id_and_book_id", unique: true
    t.index ["translator_id"], name: "index_translator_books_on_translator_id"
  end

  create_table "translators", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user", force: :cascade do |t|
    t.string "full_name"
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "author_books", "authors"
  add_foreign_key "author_books", "books"
  add_foreign_key "translator_books", "books"
  add_foreign_key "translator_books", "translators"
end
