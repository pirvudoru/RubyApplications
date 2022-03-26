require './lib/api_call'

RSpec.describe ApiCall do

  describe ".show" do
    let(:name) {'rails'}
    subject(:api_result) { ApiCall.show(name) }

    it {is_expected.to be_a(Success)}

    it "returns json as payload" do
      expect(api_result.data).to be_a(Hash)
    end

    context "return Failure because of wrong name of gem" do
      let(:name) {'gsgws'}

      it {is_expected.to be_a(Failure)}

    end


    
  end

end