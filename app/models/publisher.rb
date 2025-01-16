class Publisher < Producer
  has_many :books, foreign_key: :publisher_id
end
