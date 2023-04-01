# frozen_string_literal: true

json.extract! package, :id, :title, :tour_id, :price, :detail, :created_at, :updated_at
json.url package_url(package, format: :json)
