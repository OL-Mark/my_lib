Fabricator :author do
  name { FFaker::Name.name }
  description { FFaker::Lorem.paragraphs(2).join("\n") }
end
