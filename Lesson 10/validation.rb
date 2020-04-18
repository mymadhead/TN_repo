# frozen_string_literal: true

module Validation

  def valid?
    validate!
  rescue RuntimeError => e
    puts "Validation error: #{e.message}"
  end

end
