require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth
      callback_url = ''
      option :client_options, {
        :site               => "https://etws.etrade.com",
        :request_token_path => "/oauth/request_token",
        :access_token_path  => "/oauth/access_token",
        :authorize_url      => "https://us.etrade.com/e/t/etws/authorize"
      }
      
      def callback_url
        "http://localhost:3000/auth/etrade/callback"
      end
      
      uid do
        ""
      end
                  
    end
  end
end