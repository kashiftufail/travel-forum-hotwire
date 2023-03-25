# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'destinations/edit', type: :view do
  let(:destination) do
    Destination.create!(
      title: 'MyString',
      detail: 'MyText',
      tour: nil,
      stay_days: 1
    )
  end

  before(:each) do
    assign(:destination, destination)
  end

  it 'renders the edit destination form' do
    render

    assert_select 'form[action=?][method=?]', destination_path(destination), 'post' do
      assert_select 'input[name=?]', 'destination[title]'

      assert_select 'textarea[name=?]', 'destination[detail]'

      assert_select 'input[name=?]', 'destination[tour_id]'

      assert_select 'input[name=?]', 'destination[stay_days]'
    end
  end
end
