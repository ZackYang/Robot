# frozen_string_literal: true

module Robots
  class Base
    attr_accessor :x, :y, :orientation, :map

    extend Abilities

    def invoke(ability_name, *args)
      return unless self.class.ability_list.include?(ability_name)

      send("_execute_ability_#{ability_name}", *args)
    end

    def self.ability_list
      @ability_list ||= []
    end

    def self.add_ability(ability_name)
      ability_list << ability_name
      @ability_list = ability_list.uniq
    end

    include Abilities::SetOrientation
  end
end
