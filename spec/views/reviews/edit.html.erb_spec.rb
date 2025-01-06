require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  let(:review) {
    Review.create!(
      body: "MyText",
      rating: 1,
      book: nil
    )
  }

  before(:each) do
    assign(:review, review)
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(review), "post" do

      assert_select "textarea[name=?]", "review[body]"

      assert_select "input[name=?]", "review[rating]"

      assert_select "input[name=?]", "review[book_id]"
    end
  end
end
