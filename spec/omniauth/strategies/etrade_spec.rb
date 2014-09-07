require 'spec_helper'

describe 'OmniAuth::Stratgies::ETrade' do
  let(:access_token)    { double('AccessToken', :options => {}) }

  subject do
    OmniAuth::Strategies::Etrade.new({})
  end

  before(:each) do
    OmniAuth.config.test_mode = true
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context "client options" do
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq("https://etws.etrade.com")
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://us.etrade.com/e/t/etws/authorize')
    end

    it 'should have correct access token url' do
      expect(subject.options.client_options.access_token_url).to eq('https://etws.etrade.com/oauth/access_token')
    end

    it 'should have correct request token url' do
      expect(subject.options.client_options.request_token_url).to eq('https://etws.etrade.com/oauth/request_token')
    end
  end
end
