require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { Fabricate.build :book, publisher: publisher }

  let(:publisher) { Fabricate :publisher }

  # describe "relationships" do
  #   it { should belong_to(:authors).through(:author_books).optional }
  #   it { should have_many(:reviews) }
  #   it { should have_and_belong_to_many(:categories) }
  # end

  describe "validations" do
    # it { should validate_presence_of(:title) }

    # Valid ISBN examples
    let(:valid_isbn_10) { '123456789X' }
    let(:valid_isbn_13) { '9781234567897' }

    # Invalid ISBN examples
    let(:invalid_isbn_10_format) { '12345X7890' }
    let(:invalid_isbn_13_format) { '97812345' }
    let(:invalid_isbn_10_checksum) { '1234567890' }
    let(:invalid_isbn_13_checksum) { '9781234567890' }

    it { should validate_uniqueness_of(:isbn).case_insensitive }

    context 'with valid ISBN' do
      it 'is valid with a correct ISBN-10' do
        subject.isbn = valid_isbn_10
        expect(subject).to be_valid
      end

      it 'is valid with a correct ISBN-13' do
        subject.isbn = valid_isbn_13
        expect(subject).to be_valid
      end
    end

    context 'with invalid ISBN' do
      it 'is invalid with a malformed ISBN-10' do
        subject.isbn = invalid_isbn_10_format
        expect(subject).to be_invalid
        expect(subject.errors[:isbn]).to include('must be a valid 10 or 13-digit ISBN (e.g., 123456789X or 9781234567897)')
      end

      it 'is invalid with a malformed ISBN-13' do
        subject.isbn = invalid_isbn_13_format
        expect(subject).to be_invalid
        expect(subject.errors[:isbn]).to include('must be a valid 10 or 13-digit ISBN (e.g., 123456789X or 9781234567897)')
      end

      it 'is invalid with an incorrect checksum for ISBN-10' do
        subject.isbn = invalid_isbn_10_checksum
        expect(subject).to be_invalid
        expect(subject.errors[:isbn]).to include('has an invalid checksum for ISBN-10')
      end

      it 'is invalid with an incorrect checksum for ISBN-13' do
        subject.isbn = invalid_isbn_13_checksum
        expect(subject).to be_invalid
        expect(subject.errors[:isbn]).to include('has an invalid checksum for ISBN-13')
      end
    end

    context 'with blank ISBN' do
      it 'is valid with ISBN = nil' do
        subject.isbn = nil
        expect(subject).to be_valid
      end
    end
  end

  # describe "attributes" do
  #   it "has expected attributes" do
  #     book = Book.new(
  #       title: "The Great Gatsby",
  #       isbn: "978-0743273565",
  #       published_at: Date.new(1925, 4, 10),
  #       description: "A story of the fabulously wealthy Jay Gatsby",
  #       price: 9.99
  #     )

  #     expect(book).to have_attributes(
  #       title: "The Great Gatsby",
  #       isbn: "978-0743273565",
  #       published_at: Date.new(1925, 4, 10),
  #       description: "A story of the fabulously wealthy Jay Gatsby",
  #       price: 9.99
  #     )
  #   end
  # end

  # describe "scopes" do
  #   describe ".published" do
  #     it "returns books that have been published" do
  #       published_book = create(:book, published_at: 1.day.ago)
  #       unpublished_book = create(:book, published_at: nil)

  #       expect(Book.published).to include(published_book)
  #       expect(Book.published).not_to include(unpublished_book)
  #     end
  #   end

  #   describe ".by_title" do
  #     it "returns books sorted by title" do
  #       book1 = create(:book, title: "Z Book")
  #       book2 = create(:book, title: "A Book")

  #       expect(Book.by_title).to eq([ book2, book1 ])
  #     end
  #   end
  # end

  # describe "instance methods" do
  #   describe "#full_title" do
  #     it "returns title with author name if author exists" do
  #       author = create(:author, name: "F. Scott Fitzgerald")
  #       book = create(:book, title: "The Great Gatsby", author: author)

  #       expect(book.full_title).to eq("The Great Gatsby by F. Scott Fitzgerald")
  #     end

  #     it "returns only title if author doesn't exist" do
  #       book = create(:book, title: "The Great Gatsby", author: nil)

  #       expect(book.full_title).to eq("The Great Gatsby")
  #     end
  #   end
  # end
end
