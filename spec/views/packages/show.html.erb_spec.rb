# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'packages/show', type: :view do
  before(:each) do
    assign(:package, Package.create!(
                       title: 'Title',
                       tour: nil,
                       price: 2.5,
                       detail: 'MyText'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
  end
end
