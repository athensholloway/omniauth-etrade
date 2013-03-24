require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth
      option :client_options, {
        :site               => 'https://etws.etrade.com',
        :authorize_url      => 'https://us.etrade.com/e/t/etws/authorize',
        :request_token_url  => 'https://etws.etrade.com/oauth/request_token',
        :access_token_url   => 'https://etws.etrade.com/oauth/access_token'
      }

      uid { raw_info['uid'] }

      info do
        {
          'uid'   => raw_info['uid'],
          'name'  => raw_info['display_name'],
          'email' => raw_info['email']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/1/account/info').body)
      end
    
    end
  end
end