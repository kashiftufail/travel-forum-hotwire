# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'destinations/show', type: :view do
  before(:each) do
    assign(:destination, Destination.create!(
                           title: 'Title',
                           detail: 'MyText',
                           tour: nil,
                           stay_days: 2
                         ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
