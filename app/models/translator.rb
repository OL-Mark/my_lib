class Translator < Producer
  has_many :books, foreign_key: :translator_id
end
