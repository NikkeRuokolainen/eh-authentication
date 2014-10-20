require 'httparty'
require 'singleton'
require 'ostruct'

module EhjobAuthentication
  class ApiClient
    include Singleton
    include HTTParty

    format :json
    default_options.merge!(verify: false)
    headers 'Content-Type' => 'application/json'
    headers 'Accept' => 'application/json'
    debug_output $stderr if ENV['HTTPARTY_DEBUG'].present?

    headers 'AUTHORIZATION' => "Token token=#{Figaro.env.single_authentication_key}"

    delegate :base_url, to: 'EhjobAuthentication.config'

    def associate_user(params)
      url = "#{base_url}/api/users/associate_user"
      response = self.class.post url, body: JSON.generate(params)
      OpenStruct.new(response.parsed_response) if response.success?
    end
  end
end
