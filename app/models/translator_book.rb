class TranslatorBook < ApplicationRecord
  belongs_to :translator
  belongs_to :book

  # TODO: Add order column to set specific order for translators
end
