require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth
      option :name, "etrade"

      option :client_options, {
        :site => 'https://etws.etrade.com',
        :request_token_path => '/oauth/request_token/',
        :access_token_path => '/oauth/access_token/',
        :authorize_path => '/oauth/authorize/',
        :http_method => :get,
        :scheme => :query_string
      }

      uid do
        user_data['profile_id']
      end

      info do
        user_data.delete_if { |k, v| v.nil? || v.length == 0 }
      end

      extra do
        user_data
      end

      def user_data
        @info ||= MultiJson.decode(@access_token.get('/oapi/profiles/info/me').body)['main']
      end

      # For callback_confirmed to true so omniauth-oauth will set the
      # :oauth_verifier during callback
      def callback_phase
        session['oauth'][name.to_s]['callback_confirmed'] = true
        super
      end
    end
  end
end