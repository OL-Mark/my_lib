Fabricator :book do
  title { FFaker::Book.title }
  authors { [ Fabricate(:author) ] }
  publisher { Fabricate :publisher }
  translators { [ Fabricate(:translator) ] }
  isbn { FFaker::Book.isbn }
  annotation { FFaker::Book.description }
end
