module Types
  class AuthProviderEmailInput < Types::BaseInputObject
    description 'Authentication'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end
