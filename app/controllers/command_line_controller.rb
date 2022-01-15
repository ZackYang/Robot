# frozen_string_literal: true

class CommandLineController
  def initialize(map = Map::TableTop.new, robot = DefaultRobot.new)
    @map = map
    @robot = robot
    @robot.map = @map
  end

  def exec(cmd)
    @robot.invoke(parse_cmd(cmd), *parse_arguments(cmd))
  end

  private

  def parse_cmd(cmd)
    cmd.split("\s").first&.downcase.to_sym
  end

  def parse_arguments(cmd)
    return unless cmd.include?("\s")

    spliter_index = cmd.index("\s")
    args = cmd.strip[spliter_index..]
    return if args.blank?

    args.split(',').map(&:strip).map do |arg|
      numeric?(arg) ? arg.to_i : arg.upcase
    end
  end

  def numeric?(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil
  end
end
