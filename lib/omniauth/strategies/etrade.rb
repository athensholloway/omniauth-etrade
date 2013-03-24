require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth
      option :client_options, {
        :site => 'https://api.mendeley.com',
        :request_token_path => '/oauth/request_token/',
        :access_token_path => '/oauth/access_token/',
        :authorize_path => '/oauth/authorize/',
      }
                  
    end
  end
end