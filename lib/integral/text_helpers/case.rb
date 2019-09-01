# frozen_string_literal: true

module Integral
	module TextHelpers
		module Case

			# Opposite to String.capitalize
			# 'Welcome to Miami' -> 'welcome to Miami'
			#
			def uncapitalize(string)
				return if string.blank?
				str = string.to_s
				str[0, 1].downcase + str[1..-1]
			end

		end
	end
end
