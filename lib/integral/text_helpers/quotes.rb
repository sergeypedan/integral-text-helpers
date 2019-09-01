# frozen_string_literal: true

module Integral
	module TextHelpers
		module Quotes

			def includes_quotes?(string)
				/"|'|”|“|„|«|»/ === string
			end

			# first substitutes left quote, than right quote
			def to_inner_quotes(string)
				string.sub(/«|\"|\'|“/, "„").sub(/»|\"|\'|”/, "“")
			end

		end
	end
end
