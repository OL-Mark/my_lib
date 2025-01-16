Fabricator :publisher do
  name { FFaker::Company.name }
  description { FFaker::Lorem.paragraphs(2).join("\n") }
end
