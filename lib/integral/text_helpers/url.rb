# frozen_string_literal: true

module Integral
	module TextHelpers
		module Url

			HTTP_PROTOCOL_REGEX = /https?:\/\//i


			# "https://yandex.ru" -> "https://yandex.ru"
			#  "http://yandex.ru" -> "http://yandex.ru"
			#         "yandex.ru" -> "http://yandex.ru"
			#                 ""  -> nil
			#                 nil -> nil
			def add_missing_http(url)
				return url if HTTP_PROTOCOL_REGEX === url
				"http://#{url}" if url.present?
			end


			def pretty_external_URL(url)
				CGI.unescape(url)
					 .sub(/https?:\/\//, '')
					 .truncate(50, omission: '...')
			end


			# https://vk.com --> vk.com
			# http://vk.com  --> vk.com
			def strip_http(url)
				url.sub HTTP_PROTOCOL_REGEX, ""
			end

		end
	end
end
