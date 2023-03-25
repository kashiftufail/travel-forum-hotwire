# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'destinations/new', type: :view do
  before(:each) do
    assign(:destination, Destination.new(
                           title: 'MyString',
                           detail: 'MyText',
                           tour: nil,
                           stay_days: 1
                         ))
  end

  it 'renders new destination form' do
    render

    assert_select 'form[action=?][method=?]', destinations_path, 'post' do
      assert_select 'input[name=?]', 'destination[title]'

      assert_select 'textarea[name=?]', 'destination[detail]'

      assert_select 'input[name=?]', 'destination[tour_id]'

      assert_select 'input[name=?]', 'destination[stay_days]'
    end
  end
end
