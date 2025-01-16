class AuthorBook < ApplicationRecord
  belongs_to :author
  belongs_to :book

  # TODO: Add order column to set specific order for authors
end
