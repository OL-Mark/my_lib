# TODO: Add basic specs
class Translator < Producer
  has_many :books, through: :translator_books

  # TODO: Add validations
end
