require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      number: "MyString",
      category: nil,
      price: 1.5,
      quantity_in_hand: 1,
      detail: "MyText",
      size: "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[number]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[quantity_in_hand]"

      assert_select "textarea[name=?]", "product[detail]"

      assert_select "input[name=?]", "product[size]"
    end
  end
end
