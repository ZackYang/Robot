# frozen_string_literal: true

module Map
  class TableTop < Map::Base
    def generate_matrix
      @matrix = ::Matrix.build(height, width) { true }
    end
  end
end
