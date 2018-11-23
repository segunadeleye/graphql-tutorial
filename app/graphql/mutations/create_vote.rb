module Mutations
  class CreateVote < Mutations::BaseMutation
    argument :link_id, ID, required: true

    field :vote, Types::VoteType, null: true

    def resolve(link_id:)
      vote = Vote.create(
        link: Link.find_by(id: link_id),
        user: context[:current_user]
      )
      { vote: vote }
    end
  end
end
