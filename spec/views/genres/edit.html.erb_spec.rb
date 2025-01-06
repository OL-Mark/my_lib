require 'rails_helper'

RSpec.describe "genres/edit", type: :view do
  let(:genre) {
    Genre.create!(
      title: "MyString",
      books: nil
    )
  }

  before(:each) do
    assign(:genre, genre)
  end

  it "renders the edit genre form" do
    render

    assert_select "form[action=?][method=?]", genre_path(genre), "post" do

      assert_select "input[name=?]", "genre[title]"

      assert_select "input[name=?]", "genre[books_id]"
    end
  end
end
