module Types
  class QueryType < Types::BaseObject
    field :allLinks, [LinkType], null: false, description: 'Fetch all links'
    field :link, LinkType, null: true do
      description 'Fetch link'
      argument :id, ID, required: true
    end

    def all_links
      Link.all
    end

    def link(id:)
      Link.find(id)
    end
  end
end
