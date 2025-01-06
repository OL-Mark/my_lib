json.extract! book, :id, :title, :desc, :rating, :created_at, :updated_at
json.url book_url(book, format: :json)
