require 'rails_helper'

RSpec.describe "genres/show", type: :view do
  before(:each) do
    assign(:genre, Genre.create!(
      title: "Title",
      books: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
