require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Redbox < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.redbox.com/v5',
        :authorize_url => 'https://api.redbox.com/oauth2-13/authorize',
        :token_url => 'https://api.redbox.com/oauth2-13/token'
      }

      option :scope, 'rentalhistory'
      option :provider_ignores_state, true

      uid { access_token.params['customer_number'] }

      # info do
      #   {
      #     'nickname' => raw_info['login'],
      #     'email' => raw_info['email'],
      #     'name' => raw_info['name'],
      #   }
      # end

      # def raw_info
      #   # @raw_info ||= access_token.params
      #   debugger
      #   access_token.options[:mode] = :query
      #   @raw_info ||= access_token.get("customer/#{uid}/rentalhistory").parsed
      # end
    end
  end
end
