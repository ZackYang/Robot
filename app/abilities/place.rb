# frozen_string_literal: true

module Abilities
  module Place
    NAME = :place

    def _execute_ability_place(*args)
      return unless map&.available?(args[0], args[1])
      return unless _execute_ability_set_orientation(args[2])

      self.x = args[0]
      self.y = args[1]
    end

    def self.included(base)
      base.add_ability(self::NAME)
    end
  end
end
