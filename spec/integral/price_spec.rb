RSpec.describe ApplicationHelper, ".price_range_human", type: :helper do

	subject { price_range_human(min, max, unit: unit, verbose: verbose) }

	let(:verbose) { false }
	let(:unit) { "₽" }
	let(:min) { 100 }
	let(:max) { 200 }

	context "correct" do
		context "short" do
			it { is_expected.to eq "100 ₽ — 200 ₽" }
		end

		context "verbose" do
			let(:verbose) { true }
			it { is_expected.to eq "От 100 ₽ до 200 ₽"  }
		end

		context "only min" do
			let(:max) { nil }
			it { is_expected.to eq "От 100 ₽" }
		end

		context "only max" do
			let(:min) { nil }
			it { is_expected.to eq "До 200 ₽" }
		end
	end

	context "incorrect" do
		context "min is String" do
			let(:min) { "100 "}
			it do expect { subject }.to raise_exception ArgumentError, "Both prices must be Numeric or Nil" end
		end

		context "max is String" do
			let(:max) { "200" }
			it do expect { subject }.to raise_exception ArgumentError, "Both prices must be Numeric or Nil" end
		end
	end

end
