class ProductResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  self.find_record_method = ->(model_class:, id:, params:) do
    # If the id is an integer use the classic `find` method.
    # But if it's not an integer, search for that post by the slug.
    id.to_i == 0 ? model_class.find_by_slug(id) : model_class.find(id)
  end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text ,link_to_resource: true
  field :number, as: :text
  field :category, as: :belongs_to
  field :price, as: :number
  field :quantity_in_hand, as: :number
  field :detail, as: :textarea
  field :size, as: :text
  field :avatar, as: :file
  # add fields here
end
