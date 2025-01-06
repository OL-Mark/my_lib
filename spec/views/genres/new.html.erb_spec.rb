require 'rails_helper'

RSpec.describe "genres/new", type: :view do
  before(:each) do
    assign(:genre, Genre.new(
      title: "MyString",
      books: nil
    ))
  end

  it "renders new genre form" do
    render

    assert_select "form[action=?][method=?]", genres_path, "post" do

      assert_select "input[name=?]", "genre[title]"

      assert_select "input[name=?]", "genre[books_id]"
    end
  end
end
