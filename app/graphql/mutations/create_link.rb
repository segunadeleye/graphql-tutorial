module Mutations
  class CreateLink < Mutations::BaseMutation
    # arguments passed as args
    argument :description, String, required: true
    argument :url, String, required: true

    # return type for the mutation
    field :link, Types::LinkType, null: true

    def resolve(description:, url:)
      link = Link.create(
        description: description,
        url: url
      )
      { link: link }
    end
  end
end
