# frozen_string_literal: true

module Abilities
  module Left
    NAME = :left

    def _execute_ability_left(*_)
      return unless map.present? && orientation.present?

      next_orientation_index = allowed_orientations.index(orientation) - 1
      self.orientation = allowed_orientations[next_orientation_index]
    end

    def self.included(base)
      base.add_ability(self::NAME)
    end
  end
end
