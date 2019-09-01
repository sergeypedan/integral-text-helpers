# frozen_string_literal: true

module Integral
	module TextHelpers
		module Price

			# От 100 ₽ до 5 000 ₽   verbose: true
			# 100 ₽ — 5 000 ₽       verbose: false
			# От 100 ₽
			# До 5 000 ₽
			def price_range_human(min, max, unit: "₽", verbose: false)
				fail ArgumentError, "Both prices must be Numeric or Nil" unless [min, max].compact.all? { |i| i.is_a? Numeric }
				return "От #{number_to_currency min, unit: unit} до #{number_to_currency max, unit: unit}" if min && max && verbose
				return "#{number_to_currency min, unit: unit} — #{number_to_currency max, unit: unit}"     if min && max
				return "От #{number_to_currency min, unit: unit}" if min.present?
				return "До #{number_to_currency max, unit: unit}"
			end

		end
	end
end
