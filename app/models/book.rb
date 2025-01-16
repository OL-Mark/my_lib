# TODO: Remove author_id column
class Book < ApplicationRecord
  VALID_ISBN_REGEX = /\A(?:\d{9}X|\d{10}|\d{13})\z/

  has_many :author_books, dependent: :destroy
  has_many :translator_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :translators, through: :translator_books
  belongs_to :publisher

  validates :title, presence: true
  validates :authors, presence: true
  validates :publisher_id, presence: true
  validates :isbn, allow_nil: true, uniqueness: true, format: {
    with: VALID_ISBN_REGEX,
    message: "must be a valid 10 or 13-digit ISBN (e.g., 123456789X or 9781234567897)"
  }
  validate :isbn_checksum

  # TODO: Add full_title method implementation which should contain author's name
  def full_title; end

  private

  # Custom validation for ISBN checksum
  def isbn_checksum
    return if isbn.blank?

    if isbn.length == 10
      errors.add(:isbn, "has an invalid checksum for ISBN-10") unless valid_isbn_10?(isbn)
    elsif isbn.length == 13
      errors.add(:isbn, "has an invalid checksum for ISBN-13") unless valid_isbn_13?(isbn)
    else
      errors.add(:isbn, "must be either 10 or 13 characters long")
    end
  end

  # Validate ISBN-10 checksum
  def valid_isbn_10?(isbn)
    sum = isbn.chars[0..8].each_with_index.sum { |digit, index| digit.to_i * (10 - index) }
    checksum = isbn[-1] == "X" ? 10 : isbn[-1].to_i
    (sum + checksum) % 11 == 0
  end

  # Validate ISBN-13 checksum
  def valid_isbn_13?(isbn)
    sum = isbn.chars[0..11].each_with_index.sum do |digit, index|
      digit.to_i * (index.even? ? 1 : 3)
    end
    checksum = (10 - (sum % 10)) % 10
    checksum == isbn[-1].to_i
  end
end
