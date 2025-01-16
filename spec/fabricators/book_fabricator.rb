Fabricator :book do
  title { Faker::Book.title }
  author { Fabricate :author }
  publisher { Fabricate :publisher }
  translator { Fabricate :translator }
  isbn { Faker::Code.isbn }
  description { Faker::Lorem.paragraph }
  price { Faker::Commerce.price }
end
