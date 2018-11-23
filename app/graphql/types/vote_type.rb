module Types
  class VoteType < Types::BaseObject
    description 'Vote for Link'
    field :id, ID, null: false
    field :user, UserType, null: false
    field :link, LinkType, null: false
  end
end
