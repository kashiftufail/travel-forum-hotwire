# frozen_string_literal: true

json.extract! destination, :id, :title, :detail, :tour_id, :stay_days, :created_at, :updated_at
json.url destination_url(destination, format: :json)
