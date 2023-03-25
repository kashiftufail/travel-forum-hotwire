class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :text
  field :role_type, as: :select, enum: ::User.role_types
  field :fb_uid, as: :text
  field :youtube_uid, as: :text
  field :instagram_uid, as: :text
  field :member_type, as: :select, enum: ::User.member_types
  field :profile, as: :has_one
  # add fields here
end
