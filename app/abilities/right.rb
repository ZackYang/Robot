# frozen_string_literal: true

module Abilities
  module Right
    NAME = :right

    def _execute_ability_right(*_)
      return unless map.present? && orientation.present?

      next_orientation_index = (allowed_orientations.index(orientation) + 1) % 4
      self.orientation = allowed_orientations[next_orientation_index]
    end

    def self.included(base)
      base.add_ability(self::NAME)
    end
  end
end
