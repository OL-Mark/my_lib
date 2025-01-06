require 'rails_helper'

RSpec.describe "genres/index", type: :view do
  before(:each) do
    assign(:genres, [
      Genre.create!(
        title: "Title",
        books: nil
      ),
      Genre.create!(
        title: "Title",
        books: nil
      )
    ])
  end

  it "renders a list of genres" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
