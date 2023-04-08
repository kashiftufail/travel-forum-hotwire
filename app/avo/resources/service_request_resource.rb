class ServiceRequestResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :phone, as: :text
  field :no_of_night_stays, as: :number
  field :email, as: :text
  field :detail, as: :textarea
  field :service_type, as: :text
  field :user, as: :belongs_to
  # add fields here
end
