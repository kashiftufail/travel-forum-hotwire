# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'packages/index', type: :view do
  before(:each) do
    assign(:packages, [
             Package.create!(
               title: 'Title',
               tour: nil,
               price: 2.5,
               detail: 'MyText'
             ),
             Package.create!(
               title: 'Title',
               tour: nil,
               price: 2.5,
               detail: 'MyText'
             )
           ])
  end

  it 'renders a list of packages' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
