class BookingResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id 
  # Fields generated from the model  
  field :email, as: :text, link_to_resource: true 
  field :phone, as: :text
  field :stay_nights, as: :text
  field :detail, as: :text
  field :departure_date, as: :date_time
  field :return_date, as: :date_time
  field :destinations, as: :has_many
  field :user, as: :belongs_to
  # add fields here
end
