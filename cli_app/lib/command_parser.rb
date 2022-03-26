require './lib/show_command'

class CommandParser 
    class << self
        def parse(argv)
            if argv[0] == "show"
               ShowCommand.new(argv[1]).result
            else
                STDERR.puts("The command doesn't exist")
                exit(1)
            end
        end
    end
end
