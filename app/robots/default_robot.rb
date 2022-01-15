# frozen_string_literal: true

class DefaultRobot < Robots::Base
  extend Abilities

  include Abilities::Place
  include Abilities::Move
  include Abilities::Left
  include Abilities::Right
  include Abilities::Report
end
