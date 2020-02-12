# frozen_string_literal: true

module Integral
  module TextHelpers
    module PhoneHelper

      require "active_support/number_helper/number_converter"
      require "active_support/number_helper/number_to_phone_converter"

      # Uses Rails `number_to_phone` helper
      # https://apidock.com/rails/v5.2.3/ActionView/Helpers/NumberHelper/number_to_phone
      def humanize_telephone(number)
        number = unformat_phone(number)
        number_to_phone(number, { area_code: true, country_code: 7, delimiter: ' ', raise: true })
      end


      def number_to_phone(number, options = {})
        return unless number
        phone = ActiveSupport::NumberHelper::NumberToPhoneConverter.convert(number, options.symbolize_keys)
        ERB::Util.html_escape(phone)
      end


      # Accepts standard HTML options like `class: 'my-class, id: 'my-id', like standard `link_to` does
      def phone_to(phone, humanize: true, icon: nil)
        options = {}
        return if phone.blank?
        link_text = humanize ? humanize_telephone(phone) : phone
        link_text = fa_icon(icon, text: link_text) if icon.present?

        if self.respond_to?(:link_to)
          link_to link_text, "tel:#{unformat_phone(phone)}", options.merge({ rel: :nofollow })
        else
          class_list =  case options[:class].class
                        when Array  then options[:class]
                        when String then options[:class].split(" ")
                        else []
                        end

          [
            "<a ",
            "href=\"tel:#{unformat_phone(phone)}\" ",
            ("id=\"#{options[:id]}\" " if options[:id]),
            ("class=\"#{class_list.join(" ")}\" " if class_list.any?),
            "rel=\"nofollow\" ",
            ("data=\"#{options[:data]}\"" if options[:data]),
            ">",
            link_text,
            "</a>"
          ].join
        end
      end


      # +7 (495) 123-45-67 --> 4951234567
      #  8 (495) 123-45-67 --> 4951234567
      #  7 (495) 123-45-67 --> 4951234567
      #    (495) 123-45-67 --> 4951234567
      def unformat_phone(phone)
        phone.scan(/\d/).join     # leaves only digits
             .sub(/^(7|8)/, '')   # removes leading country code
      end

    end
  end
end
