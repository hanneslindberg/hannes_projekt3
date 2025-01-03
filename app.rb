require 'bcrypt'

class App < Sinatra::Base
  helpers do
      def sendgrid_client
          @sg ||= SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      end
  end
end