RSpec.describe Integral::TextHelpers::PhoneHelper, ".unformat_phone", type: :helper do

  include Integral::TextHelpers::PhoneHelper

  subject { unformat_phone(input) }

  context "fully qualified Russian phone" do
    let(:input) { "+7 (495) 123-45-67" }
    it { is_expected.to eq "4951234567" }
  end

  context "Russian phone starting with 8" do
    let(:input) { "8 (495) 123-45-67" }
    it { is_expected.to eq "4951234567" }
  end

  context "Russian phone starting with 7" do
    let(:input) { "(495) 123-45-67" }
    it { is_expected.to eq "4951234567" }
  end

  context "Russian phone starting with 7" do
    let(:input) { "7 (495) 123-45-67" }
    it { is_expected.to eq "4951234567" }
  end

  context "Russian phone without parenteses" do
    let(:input) { "7 495 123-45-67" }
    it { is_expected.to eq "4951234567" }
  end

  context "Russian phone with dots as separators" do
    let(:input) { "7.495.123.45.67" }
    it { is_expected.to eq "4951234567" }
  end

end
