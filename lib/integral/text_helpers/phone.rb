# frozen_string_literal: true

module Integral
	module TextHelpers
		module PhoneHelper

			# Uses Rails `number_to_phone` helper
			# https://apidock.com/rails/v4.2.7/ActionView/Helpers/NumberHelper/number_to_phone
			def humanize_telephone(number)
				number = unformat_phone(number)
				number_to_phone(number, { area_code: true, country_code: 7, delimiter: ' ', raise: true })
			end


			# Accepts standard HTML options like `class: 'my-class, id: 'my-id', like standard `link_to` does
			def phone_to(number, humanize: true, icon: nil, options = {})
				return if number.blank?
				link_text = humanize ? humanize_telephone(number) : number
				link_text = fa_icon(icon, text: link_text) if icon.present?
				link_to link_text, "tel:#{unformat_phone(number)}", options.merge({ rel: :nofollow })
			end


			# +7 (495) 123-45-67 --> 4951234567
			# 8 (495) 123-45-67  --> 4951234567
			# 7 (495) 123-45-67  --> 4951234567
			def unformat_phone(number)
				number =  case number.first
									when '8' then number.sub(/^8/,   '') # removes leading '8'
									when '7' then number.sub(/^7/,   '') # removes leading '7'
									when '+' then number.sub('+7', '') # removes leading '+7'
									else number
									end
				number = number.gsub /\s/, ''     # removes any kind of space
				number = number.gsub /[\(\)]/, '' # removes parenthesis
				number = number.gsub /[-–—]/, ''   # removes dashes and hyphens
			end

		end
	end
end
