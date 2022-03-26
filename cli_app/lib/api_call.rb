require 'faraday'
require './lib/show_command'
require './results/success'
require './results/failure'

class ApiCall
    @@base_url = 'https://rubygems.org/api/v1'
    Faraday.default_adapter = :net_http

    class << self
    
        def show(name)
            url_completion = "/gems/#{name}.json"
            url = @@base_url + url_completion
            response = Faraday.get(url)

            if response.status == 200
                Success.new(JSON.parse(response.body))
                # [:success, JSON.parse(response.body)]
            else
                Failure.new({ 'message' => response.body })
                # [:error, { 'message' => response.body }]
            end
        end

        def search(query)
            return 0
        end

    end


end