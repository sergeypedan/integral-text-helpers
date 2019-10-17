# frozen_string_literal: true

module Integral
	module TextHelpers
		module Price

			require "active_support/number_helper/number_converter"
			require "active_support/number_helper/rounding_helper"
			require "active_support/number_helper/number_to_delimited_converter"
			require "active_support/number_helper/number_to_rounded_converter"
			require "active_support/number_helper/number_to_currency_converter"

			DEFAULT_OPTIONS = { format: "%n %u", precision: 0 }

			# От 100 ₽ до 5 000 ₽   verbose: true
			# 100 ₽ — 5 000 ₽       verbose: false
			# От 100 ₽
			# До 5 000 ₽
			def price_range_human(min, max, unit: "₽", verbose: false)
				fail ArgumentError, "Both prices must be Numeric or Nil" unless [min, max].compact.all? { |i| i.is_a? Numeric }

				options = DEFAULT_OPTIONS.merge({ unit: unit })
				min_rub   = number_to_currency min, options
				max_rub   = number_to_currency max, options

				return "От #{min_rub} до #{max_rub}" if min && max && verbose
				return "#{min_rub} — #{max_rub}"     if min && max
				return "От #{min_rub}" if min
				return "До #{max_rub}" if max
			end

			private

			def number_to_currency(number, options)
				ActiveSupport::NumberHelper::NumberToCurrencyConverter.convert(number, options)
			end

		end
	end
end
