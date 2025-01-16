class Author < Producer
  has_many :books, through: :author_books
end
