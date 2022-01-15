# frozen_string_literal: true

module Abilities
  module Move
    NAME = :move

    def _execute_ability_move(*_)
      new_location = next_location
      return unless map&.available?(new_location[0], new_location[1])

      self.x = new_location[0]
      self.y = new_location[1]
    end

    def self.included(base)
      base.add_ability(self::NAME)
    end

    private

    def next_location
      next_x = x
      next_y = y
      case orientation
      when 'EAST'
        next_x += 1
      when 'WEST'
        next_x -= 1
      when 'SOUTH'
        next_y -= 1
      when 'NORTH'
        next_y += 1
      end
      [next_x, next_y]
    end
  end
end
