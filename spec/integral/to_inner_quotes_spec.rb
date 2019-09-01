# frozen_string_literal: true

RSpec.describe TextHelper, "#to_inner_quotes", type: :helper do

	subject { to_inner_quotes(text) }

	let(:text_with_inner_quotes) { "Тягач „ЗИЛ“" }

	context "no quotes at all" do
		let(:text) { "Тягач ЗИЛ" }
		it { is_expected.to eq text }
	end

	context "straight double quotes" do
		let(:text) { "Тягач \"ЗИЛ\"" }
		it { is_expected.to eq text_with_inner_quotes }
	end

	context "straight single quotes" do
		let(:text) { "Тягач 'ЗИЛ'" }
		it { is_expected.to eq text_with_inner_quotes }
	end

	context "Cyrillic typographic outer quotes" do
		let(:text) { "Тягач «ЗИЛ»" }
		it { is_expected.to eq text_with_inner_quotes }
	end

	context "Western typographic inner quotes" do
		let(:text) { "Тягач “ЗИЛ”" }
		it { is_expected.to eq text_with_inner_quotes }
	end

	context "Cyrillic typographic inner quotes" do
		let(:text) { "Тягач „ЗИЛ“" }
		it { is_expected.to eq text_with_inner_quotes }
	end

end
