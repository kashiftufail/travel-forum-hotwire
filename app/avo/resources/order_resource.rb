class OrderResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :sub_total, as: :number
  field :total, as: :number
  field :shipping_address, as: :text
  field :payment_mod, as: :number
  field :name, as: :text
  field :email, as: :text
  field :phone, as: :text
  # add fields here
end
