# frozen_string_literal: true

require "rails_helper"

RSpec.describe TextHelper, "#title_includes_category", type: :helper do

	subject { title_includes_category(title, category) }

	context "category is 1 word" do
		context "category and title do match" do
			let(:category) { "Галерея" }
			let(:title) { "гАЛЕрея" }
			it { is_expected.to eq true }
		end

		context "category and title do not match" do
			let(:category) { "Кинотеатр" }
			let(:title) { "гАЛЕрея" }
			it { is_expected.to eq false }
		end
	end

	context "category is 2 word" do
		context "category and title match" do
			context "strictoy" do
				let(:category) { "Вегетарианский кинотеатр" }
				let(:title) { "вегетарианский кинотеатр" }
				it { is_expected.to eq true }
			end

			context "ony the former has hyphen" do
				let(:category) { "Онлайн-кинотеатр" }
				let(:title) { "онлайн кинотеатр" }
				it { is_expected.to eq true }
			end

			context "ony the latter has hyphen" do
				let(:category) { "Онлайн кинотеатр" }
				let(:title) { "онлайн-кинотеатр" }
				it { is_expected.to eq true }
			end
		end

		context "category and title do not match" do
			let(:category) { "Вегетарианский кинотеатр" }
			let(:title) { "Онлайн кинотеатр" }
			it { is_expected.to eq false }
		end
	end

end
