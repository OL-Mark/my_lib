class Author < Producer
  has_many :books, foreign_key: :producer_id
end
