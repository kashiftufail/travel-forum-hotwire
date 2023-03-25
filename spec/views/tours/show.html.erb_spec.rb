# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tours/show', type: :view do
  before(:each) do
    assign(:tour, Tour.create!(
                    title: 'Title',
                    detail: 'MyText',
                    price: 2.5,
                    user: nil
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
