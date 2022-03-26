require "./lib/command_parser"
require './lib/show_command'

RSpec.describe CommandParser do
    let(:argv) { ['show','rspec']}

    it "should return the ShowResult" do
        result = CommandParser.parse(argv)

        expect(result.name).to eq 'rspec'
    end
end