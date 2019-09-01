# frozen_string_literal: true

require "integral/text_helpers/quotes"

module Integral
	module TextHelpers
		module Title

			include Integral::TextHelpers::Quotes

			def non_redundant_title_with_category(title, category, add_quotes: false)
				return [category, " «", to_inner_quotes(title), "»"].join unless title_includes_category(title, category)
				return title unless add_quotes
				return ["«", to_inner_quotes(title), "»"].join
			end

			def title_includes_category(title, category)
				title.downcase.gsub("-", " ").include? category.downcase.gsub("-", " ")
			end

		end
	end
end
