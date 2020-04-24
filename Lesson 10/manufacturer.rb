# frozen_string_literal: true
require_relative 'accessors'

module Manufacturer
  extend Accessors

  attr_accessor_with_history :manufacturer
  strong_attr_accessor('test_strong', String)
end
1