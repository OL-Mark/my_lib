require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        body: "MyText",
        rating: 2,
        book: nil
      ),
      Review.create!(
        body: "MyText",
        rating: 2,
        book: nil
      )
    ])
  end

  it "renders a list of reviews" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
