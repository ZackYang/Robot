# frozen_string_literal: true

module Abilities
  module SetOrientation
    NAME = :set_orientation

    def allowed_orientations
      %w[EAST SOUTH WEST NORTH].freeze
    end

    def _execute_ability_set_orientation(*args)
      self.orientation = args[0] if allowed_orientations.include?(args[0])
    end

    def self.included(base)
      base.add_ability(self::NAME)
    end
  end
end
