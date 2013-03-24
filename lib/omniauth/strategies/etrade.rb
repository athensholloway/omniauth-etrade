require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth
      
      option :client_options, {
        :site               => "https://etws.etrade.com",
        :request_token_path => "/oauth/request_token",
        :access_token_path  => "/oauth/access_token",
        :authorize_url      => "https://us.etrade.com/e/t/etws/authorize"
      }
      
      uid { "uid" }

      info do
        { }
      end
     
      extra do
        { }
      end
      
      raw_info do
        { }
      end
                  
    end
  end
end