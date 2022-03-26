require './lib/command_parser'

RSpec.describe CommandParser do
  describe '.parse' do
    let(:argv) { %w[show rspec] }

    subject(:parse) { CommandParser.parse(argv) }

    it 'returns the gem name' do
      expect(parse.name).to eq 'rspec'
    end
  end
end
