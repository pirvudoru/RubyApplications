#!/usr/bin/env ruby

require 'optparse'
require 'faraday'
require 'faraday/net_http'
require 'json'

Faraday.default_adapter = :net_http

base_url = 'https://rubygems.org/api/v1'


options = {}

 optparse = OptionParser.new do |opts|

    #options[:show] = nil
    opts.on('--show GEM', 'Show the gem information') do|gem|
        #options[:show] = gem
        url_completion = "/gems/#{gem}.json"
        url = base_url + url_completion
    
        response = Faraday.get(url)
    
        if response.status != 200
            STDERR.puts("The gem deosn't exit") 
            exit(1) 
        end
        
        parsed_response = JSON.parse(response.body)
    
        puts "Name: #{parsed_response['name']}"
        puts "Info: #{parsed_response['info']}"
        puts "Homepage: #{parsed_response['homepage_uri']}" if parsed_response['homepage_uri']
        puts "Gem page: #{parsed_response['gem_uri']}" if parsed_response['gem_uri']
        

        exit(0)
    
    end
    #options[:search] = nil
    opts.on('--search OPT', 'Show gems found by entered text')do|opt|
        #options[:search] = opt
        url_completion = "/search.json?query=#{opt}"
        url = base_url + url_completion
        response = Faraday.get(url)

        exit(1) if response.status != 200

        parsed_response = JSON.parse(response.body)
        
        if parsed_response.size == 0
            STDERR.puts("Nothing found...") 
            exit(1)
        end

        parsed_response.each do |gem| 
        puts "Name: #{gem['name']}"
        puts "Info: #{gem['info']} \n\n"
        end

        exit(0)

    end

end

optparse.parse!





