module Mutations
  class CreateUser < Mutations::BaseMutation
    # arguments passed as args
    argument :name, String, required: true
    argument :auth, Types::AuthProviderEmailInput, required: true

    # return type for the mutation
    field :user, Types::UserType, null: true

    def resolve(name:, auth:)
      user = User.create(
        name: name,
        email: auth.email,
        password: auth[:password]
      )
      { user: user }
    end
  end
end
