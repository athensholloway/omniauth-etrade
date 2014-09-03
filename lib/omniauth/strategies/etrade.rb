require 'omniauth'

module OmniAuth
  module Strategies
    class Etrade < OmniAuth::Strategies::OAuth

      option :client_options, {
        :site               => 'https://etws.etrade.com',
        :authorize_url      => 'https://us.etrade.com/e/t/etws/authorize',
        :request_token_url  => 'https://etws.etrade.com/oauth/request_token',
        :access_token_url   => 'https://etws.etrade.com/oauth/access_token',
        # default http_method for oauth gem is post, however etrade requires this
        # to be get
        :http_method => :get
      }

      def callback_url
        'oob'
      end

      def request_phase
        begin
          request_token = consumer.get_request_token({:oauth_callback => callback_url}, options.request_params)
          session['oauth'] ||= {}
          session['oauth'][name.to_s] = {'callback_confirmed' => request_token.callback_confirmed?,
            'request_token' => request_token.token, 'request_secret' => request_token.secret}

          Rails.logger.debug { "#{request_token.to_yaml}" }

          if request_token.callback_confirmed?
            redirect request_token.authorize_url({key: options.consumer_key}.merge(options[:authorize_params])).sub! 'oauth_token', 'token'
          else
            redirect request_token.authorize_url(
              options[:authorize_params].merge(oauth_callback: callback_url, key: options.consumer_key)).sub! 'oauth_token', 'token'
          end
        rescue ::Timeout::Error => e
          fail!(:timeout, e)
        rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
          fail!(:service_unavailable, e)
        end
      end

      def callback_phase
        super
      end

      extra do
        { 'access_token' => access_token }
      end

    end
  end
end
