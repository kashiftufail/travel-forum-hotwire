class ProductResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :number, as: :text
  field :category, as: :belongs_to
  field :price, as: :number
  field :quantity_in_hand, as: :number
  field :detail, as: :textarea
  field :size, as: :text
  # add fields here
end
