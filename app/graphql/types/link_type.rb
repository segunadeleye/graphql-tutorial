module Types
  class LinkType < Types::BaseObject
    description 'Links'

    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :postedBy, UserType, method: :user, null: true
  end
end
