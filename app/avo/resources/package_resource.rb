# frozen_string_literal: true

class PackageResource < Avo::BaseResource
  self.title = :title
  self.includes = []

  self.find_record_method = lambda { |model_class:, id:, params:|
    # If the id is an integer use the classic `find` method.
    # But if it's not an integer, search for that post by the slug.
    id.to_i.zero? ? model_class.find_by_slug(id) : model_class.find(id)
  }
  # self.find_record_method
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text, link_to_resource: true  
  field :price, as: :number
  field :no_of_persons, as: :number
  field :detail, as: :textarea
  # add fields here
end
