# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'packages/edit', type: :view do
  let(:package) do
    Package.create!(
      title: 'MyString',
      tour: nil,
      price: 1.5,
      detail: 'MyText'
    )
  end

  before(:each) do
    assign(:package, package)
  end

  it 'renders the edit package form' do
    render

    assert_select 'form[action=?][method=?]', package_path(package), 'post' do
      assert_select 'input[name=?]', 'package[title]'

      assert_select 'input[name=?]', 'package[tour_id]'

      assert_select 'input[name=?]', 'package[price]'

      assert_select 'textarea[name=?]', 'package[detail]'
    end
  end
end
