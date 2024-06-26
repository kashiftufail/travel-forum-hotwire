# frozen_string_literal: true

class ProfileResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id, link_to_resource: true
  # Fields generated from the model
  field :first_name, as: :text
  field :last_name, as: :text
  field :phone, as: :text
  field :address, as: :text
  field :avatar, as: :file
  field :user, as: :belongs_to
  # add fields here
end
