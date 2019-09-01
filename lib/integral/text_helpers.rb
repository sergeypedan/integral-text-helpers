# frozen_string_literal: true

require "integral/text_helpers/version"
require "integral/text_helpers/case"
require "integral/text_helpers/phone"
require "integral/text_helpers/price"
require "integral/text_helpers/time"
require "integral/text_helpers/url"

module Integral
  module TextHelpers
    class Error < StandardError; end
  end
end
