# frozen_string_literal: true

class DestinationResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  self.find_record_method = lambda { |model_class:, id:, params:|
    # If the id is an integer use the classic `find` method.
    # But if it's not an integer, search for that post by the slug.
    id.to_i.zero? ? model_class.find_by_slug(id) : model_class.find(id)
  }

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text, link_to_resource: true
  field :detail, as: :textarea
  field :stay_days, as: :number
  field :tour, as: :belongs_to
  field :avatars, as: :files
  # add fields here
end
