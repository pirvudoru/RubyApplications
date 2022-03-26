#!/usr/bin/env ruby
require './lib/executable'
require 'pp'


prog = Executable.exec(ARGV)

pp(prog)
# Faraday.default_adapter = :net_http

# base_url = 'https://rubygems.org/api/v1'


# options = {}

#  optparse = OptionParser.new do |opts|

#     options[:show] = nil
#     opts.on('--show GEM', 'Show the gem information') do|gem|
#         options[:show] = gem
#     end
#     options[:show] = nil
#     opts.on('--search OPT', 'Show gems found by entered text')do|opt|
#         options[:search] = opt
#     end

# end

# optparse.parse!

# if options[:show]

#     url_completion = "/gems/#{options[:show]}.json"
#     url = base_url + url_completion

#     response = Faraday.get(url)

#     if response.status != 200
#         STDERR.puts("The gem deosn't exit") 
#         exit(1) 
#     end
    
#     parsed_response = JSON.parse(response.body)

#     puts "Name: #{parsed_response['name']}"
#     puts "Info: #{parsed_response['info']}"
#     puts "Homepage: #{parsed_response['homepage_uri']}" if parsed_response['homepage_uri']
#     puts "Gem page: #{parsed_response['gem_uri']}" if parsed_response['gem_uri']
#     puts ""

#     # parsed_response.each do |field|
#     #     puts "#{field[0]}: #{field[1]}"
#     # end
#     exit(0) unless options[:search]
    
# end

# if options[:search]

#     url_completion = "/search.json?query=#{options[:search]}"
#     url = base_url + url_completion
#     response = Faraday.get(url)

#     exit(1) if response.status != 200

#     parsed_response = JSON.parse(response.body)
    
#     if parsed_response.size == 0
#         STDERR.puts("Nothing found...") 
#         exit(1)
#     end

#     parsed_response.each do |gem| 
#     puts "Name: #{gem['name']}"
#     puts "Info: #{gem['info']} \n\n"
#     end

#     exit(0)
# end




