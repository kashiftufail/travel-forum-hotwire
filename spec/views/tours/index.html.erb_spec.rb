# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tours/index', type: :view do
  before(:each) do
    assign(:tours, [
             Tour.create!(
               title: 'Title',
               detail: 'MyText',
               price: 2.5,
               user: nil
             ),
             Tour.create!(
               title: 'Title',
               detail: 'MyText',
               price: 2.5,
               user: nil
             )
           ])
  end

  it 'renders a list of tours' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
