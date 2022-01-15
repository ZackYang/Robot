# frozen_string_literal: true

module Abilities
  module Report
    NAME = :report

    def _execute_ability_report(*_)
      puts("Output: #{x},#{y},#{orientation}")
    end

    def self.included(base)
      base.add_ability(self::NAME)
    end
  end
end
