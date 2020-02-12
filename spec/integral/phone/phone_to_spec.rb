RSpec.describe Integral::TextHelpers::PhoneHelper, ".phone_to", type: :helper do

  include Integral::TextHelpers::PhoneHelper

  context "one" do
    let(:input) { "4951234567" }
    it do
      expect( phone_to(input) ).to eq "+7 (495) 123-45-67"
    end
  end

end
