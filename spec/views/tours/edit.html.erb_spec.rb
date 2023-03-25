# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tours/edit', type: :view do
  let(:tour) do
    Tour.create!(
      title: 'MyString',
      detail: 'MyText',
      price: 1.5,
      user: nil
    )
  end

  before(:each) do
    assign(:tour, tour)
  end

  it 'renders the edit tour form' do
    render

    assert_select 'form[action=?][method=?]', tour_path(tour), 'post' do
      assert_select 'input[name=?]', 'tour[title]'

      assert_select 'textarea[name=?]', 'tour[detail]'

      assert_select 'input[name=?]', 'tour[price]'

      assert_select 'input[name=?]', 'tour[user_id]'
    end
  end
end
