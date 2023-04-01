# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'packages/new', type: :view do
  before(:each) do
    assign(:package, Package.new(
                       title: 'MyString',
                       tour: nil,
                       price: 1.5,
                       detail: 'MyText'
                     ))
  end

  it 'renders new package form' do
    render

    assert_select 'form[action=?][method=?]', packages_path, 'post' do
      assert_select 'input[name=?]', 'package[title]'

      assert_select 'input[name=?]', 'package[tour_id]'

      assert_select 'input[name=?]', 'package[price]'

      assert_select 'textarea[name=?]', 'package[detail]'
    end
  end
end
