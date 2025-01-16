class Translator < Producer
  has_many :books, through: :translator_books
end
