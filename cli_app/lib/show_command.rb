require './lib/api_call'
require './lib/help_show_command'

class ShowCommand

  class ShowResult
    attr_reader :name, :info

    def initialize(name, info)
      @name = name
      @info = info
    end
  end

  class << self
    def create(args)
      return HelpShowCommand.new if args.empty?

      new(args.first)
    end
  end

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def result
    res = ApiCall.show(@name)

    ShowResult.new(res['name'], res['info'])
  end
end