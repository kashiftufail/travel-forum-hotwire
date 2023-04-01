# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  let(:product) do
    Product.create!(
      name: 'MyString',
      number: 'MyString',
      category: nil,
      price: 1.5,
      quantity_in_hand: 1,
      detail: 'MyText',
      size: 'MyString'
    )
  end

  before(:each) do
    assign(:product, product)
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(product), 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[number]'

      assert_select 'input[name=?]', 'product[category_id]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[quantity_in_hand]'

      assert_select 'textarea[name=?]', 'product[detail]'

      assert_select 'input[name=?]', 'product[size]'
    end
  end
end
