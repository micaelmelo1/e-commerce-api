# frozen_string_literal: true

module StaticTokenAuthenticatable
  extend ActiveSupport::Concern

  included do
    STATIC_TOKEN_AUTH = ENV['STATIC_TOKEN_AUTH'] || Rails.application.credentials.token[:auth]

    before_action :authenticate!

    def authenticate!
      unless params[:token] == STATIC_TOKEN_AUTH
        render json: { errors: 'Unauthorized access' }, status: :unauthorized
      end
    end
  end
end