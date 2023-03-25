# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'destinations/index', type: :view do
  before(:each) do
    assign(:destinations, [
             Destination.create!(
               title: 'Title',
               detail: 'MyText',
               tour: nil,
               stay_days: 2
             ),
             Destination.create!(
               title: 'Title',
               detail: 'MyText',
               tour: nil,
               stay_days: 2
             )
           ])
  end

  it 'renders a list of destinations' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
