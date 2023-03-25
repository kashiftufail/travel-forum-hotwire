# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tours/new', type: :view do
  before(:each) do
    assign(:tour, Tour.new(
                    title: 'MyString',
                    detail: 'MyText',
                    price: 1.5,
                    user: nil
                  ))
  end

  it 'renders new tour form' do
    render

    assert_select 'form[action=?][method=?]', tours_path, 'post' do
      assert_select 'input[name=?]', 'tour[title]'

      assert_select 'textarea[name=?]', 'tour[detail]'

      assert_select 'input[name=?]', 'tour[price]'

      assert_select 'input[name=?]', 'tour[user_id]'
    end
  end
end
