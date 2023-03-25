# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe '/', type: :request do
  describe 'GET /' do
    it 'renders a successful response' do
      get root_url
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('<h1>Explore Top Destination</h1>')
      expect(response).to be_successful
    end
  end

  describe 'GET /blog' do
    it 'renders a successfull response on blog page' do
      get '/blog'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('<h3 class="display-4 text-white text-uppercase">Blog</h3>')
      expect(response).to be_successful
    end
  end
end
