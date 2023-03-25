# frozen_string_literal: true

json.extract! tour, :id, :title, :detail, :price, :user_id, :created_at, :updated_at
json.url tour_url(tour, format: :json)
