# frozen_string_literal: true

RSpec.describe Integral::TextHelpers::Title, "#non_redundant_title_with_category", type: :helper do

	include Integral::TextHelpers::Title

	subject { non_redundant_title_with_category(title, category, add_quotes: add_quotes) }

	let(:add_quotes) { false }

	context "title does not include category name" do

		context "title itself does not include quotes" do
			let(:category) { "Кинотеатр" }
			let(:title) { "Московский дворец молодёжи" }
			it { is_expected.to eq "Кинотеатр «Московский дворец молодёжи»" }
		end

		context "title itself includes quotes" do
			let(:category) { "Онлайн-школа" }

			context "straight double quotes" do
				let(:title) { "Цент дистанционного обучения \"Западная Двина\"" }
				it { is_expected.to eq "Онлайн-школа «Цент дистанционного обучения „Западная Двина“»" }
			end

			context "straight single quotes" do
				let(:title) { "Цент дистанционного обучения 'Западная Двина'" }
				it { is_expected.to eq "Онлайн-школа «Цент дистанционного обучения „Западная Двина“»" }
			end

			context "Cyrillic typographic quotes" do
				let(:title) { "Цент дистанционного обучения «Западная Двина»" }
				it { is_expected.to eq "Онлайн-школа «Цент дистанционного обучения „Западная Двина“»" }
			end
		end
	end

	context "title includes category name" do
		let(:category) { "Галерея" }
		let(:title) { "Государственная третьяковская галерея" }

		context "with different letter cases" do
			let(:category) { "гАлЕрЕя" }
			let(:title) { "Государственная третьяковская галерея" }
			it { is_expected.to eq "Государственная третьяковская галерея" }
		end

		context "with multiple words in category name" do
			let(:category) { "Онлайн курс" }
			let(:title) { "Онлайн курс «Основы астрологии»" }

			context "when multiple words have different delimiters (only hyphen by now)" do
				let(:category) { "Онлайн-курс" }
				it { is_expected.to eq "Онлайн курс «Основы астрологии»" }
			end

			context "add_quotes: true" do
				let(:add_quotes) { true }
				it { is_expected.to eq "«Онлайн курс „Основы астрологии“»" }
			end

			context "add_quotes: false" do
				it { is_expected.to eq "Онлайн курс «Основы астрологии»" }
			end
		end

		context "add_quotes: true" do
			let(:add_quotes) { true }
			it { is_expected.to eq "«Государственная третьяковская галерея»" }
		end

		context "add_quotes: false" do
			it { is_expected.to eq "Государственная третьяковская галерея" }
		end

		# context "category in different case" do
		# 	let(:category) { "Галерея" }
		# 	let(:title) { "Государственная третьяковская галерея" }
		# 	it { is_expected.to eq "Государственная третьяковская галере" }
		# end

	end

end
