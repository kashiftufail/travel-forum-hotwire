# frozen_string_literal: true

json.array! @tours, partial: 'tours/tour', as: :tour
