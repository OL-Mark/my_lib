# TODO: Add basic specs
class Publisher < Producer
  has_many :books, foreign_key: :publisher_id

  # TODO: add validations
end
