# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require "integral/text_helpers/version"
require "integral/text_helpers/case"
require "integral/text_helpers/phone"
require "integral/text_helpers/price"
require "integral/text_helpers/quotes"
require "integral/text_helpers/time"
require "integral/text_helpers/title"
require "integral/text_helpers/url"

module Integral
  module TextHelpers
    class Error < StandardError; end
  end
end
