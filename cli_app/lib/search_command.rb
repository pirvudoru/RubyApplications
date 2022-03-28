require './lib/api_call'
require './lib/help_search_command'
require './lib/info_result'

class SearchCommand

  class SearchResult
    attr_reader :gem_list
    def initialize(list)
      @gem_list = list
    end
  end

  class << self
    def create(args)
      return HelpSearchCommand.new if args.empty?

      if args.length() > 1 
        args = to_s_query(args)
      end
      
      new(args)
    end

    
    def to_s_query(query)
      string_query = ''
      query.each do |q|
        string_query = string_query + "+#{q}"
      end

      return string_query[1..]
  end

  end

  attr_reader :query
  def initialize(query)
    @query = query
  end

  def result
    result = ApiCall.search(@query)

    if result.success?
      return SearchResult.new(result.data)
    end

    InfoResult.new(result.data['message'])
  end


end
