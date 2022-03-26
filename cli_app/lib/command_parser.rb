# frozen_string_literal: true

require './lib/show_command'
require './lib/help_command'

class CommandParser
  class << self
    def parse(argv)
      if argv[0] == 'show'
        ShowCommand.create(argv[1..])
      else
        HelpCommand.create
      end
    end
  end
end
