# frozen_string_literal: true

require 'matrix'

module Map
  class Base
    attr_accessor :width, :height
    attr_reader :matrix

    def initialize(options = {})
      self.width = options[:width] || 5
      self.height = options[:height] || 5
      generate_matrix
    end

    def generate_matrix
      raise 'You have to implement this method in subclass'
    end

    def block(x_position, y_position)
      @matrix[y_position, x_position] = false
    end

    def available?(x_position, y_position)
      return unless [x_position, y_position].all? { |val| val.is_a?(Integer) && val >= 0 }

      value = @matrix[y_position, x_position]
      !!value
    end

    def print
      matrix.to_a.each { |r| puts r.inspect }
    end
  end
end
