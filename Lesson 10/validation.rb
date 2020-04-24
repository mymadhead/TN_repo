# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(attr, type, param = nil)
      @validations ||= []
      @validations << { attr: attr, type: type, param: param }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations do |validation|
        validation_method = "validate_#{validation[:type]}".to_sym
        send(validation_method, validation[:attr], validation[:param])
      end
      true
    end
  end

  def valid?
    validate!
  rescue RuntimeError => e
    puts "Validation error: #{e.message}"
  end

  private

  def validate_presence(attr, _params)
    value = instance_variable_get("@#{attr}")
    raise "#{attr} cant be empty!" if value.nil? || value.empty?
  end

  def validate_format(attr, format)
    value = instance_variable_get("@#{attr}")
    raise "Wrong format #{attr}" unless value&.match?(format)
  end

  def validate_type(attr, attr_class)
    value = instance_variable_get("@#{attr}")

    unless value.is_a?(attr_class)
      raise "#{value} non class object #{attr_class}"
    end
  end

  def validate_uniqness(attr1, attr2)
    value1 = instance_variable_get("@#{attr1}")
    value2 = instance_variable_get("@#{attr2}")
    raise 'Values cant be equal!' if value1 == value2
  end
end
