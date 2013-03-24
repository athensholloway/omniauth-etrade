require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth
      
      option :name, "etrade"
      
      def initialize(app, consumer_key = nil, consumer_secret = nil, options = {}, &block)
        opts = {
          :site               => "https://etws.etrade.com",
          :request_token_path => "/oauth/request_token",
          :access_token_path  => "/oauth/access_token",
          :authorize_url      => "https://us.etrade.com/e/t/etws/authorize"
        }
        super(app, :etrade, consumer_key, consumer_secret, opts, options, &block)
      end
      
      def auth_hash
        OmniAuth::Utils.deep_merge(super, {
          'extra'     => { 'user_hash' => @user_hash }
        })
      end
            
    end
  end
end