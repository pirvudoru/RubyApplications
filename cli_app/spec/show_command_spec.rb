
RSpec.describe ShowCommand do

    subject { ShowCommand.new('rails') }

    it "result should be rails" do
        result = subject
        expect(result.name).to eq('rails')

    end
end
