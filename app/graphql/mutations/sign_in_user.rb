module Mutations
  class SignInUser < Mutations::BaseMutation
    argument :auth, Types::AuthProviderEmailInput, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(auth:)
      user = User.find_by email: auth.email
      return unless user
      return unless user.authenticate(auth.password)

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      OpenStruct.new(user: user, token: token)
    end
  end
end
