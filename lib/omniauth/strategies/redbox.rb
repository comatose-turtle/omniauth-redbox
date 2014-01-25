require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class RedBox < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.redbox.com/v5',
        :authorize_url => 'https://api.redbox.com/oauth2-13/authorize',
        :token_url => 'https://api.redbox.com/oauth2-13/token'
      }

      option :scope, 'rentalhistory'

      def request_phase
        super
      end
      
      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['login'],
          'email' => email,
          'name' => raw_info['name'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('customer').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'redbox', 'RedBox'
