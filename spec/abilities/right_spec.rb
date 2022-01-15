# frozen_string_literal: true

class TestRobotRight < Robots::Base
  extend Abilities
  include Abilities::Right
end

describe Abilities::Right do
  let(:map) { Map::TableTop.new }
  let(:robot) { TestRobotRight.new }

  describe '#_execute_ability_right' do
    context 'when robot does not been assigned a map' do
      it 'does not change the orientation' do
        robot.invoke(:right)
        expect(robot.orientation).to eq(nil)
      end
    end

    context 'when robot does been assigned a map' do
      before do
        robot.map = map
        robot.x = 0
        robot.y = 0
      end

      context 'when robot does been placed on map north faceing' do
        before do
          robot.orientation = 'NORTH'
        end

        it 'changes the orientation to east, south, west and north' do
          robot.invoke(:right)
          expect(robot.orientation).to eq('EAST')
          robot.invoke(:right)
          expect(robot.orientation).to eq('SOUTH')
          robot.invoke(:right)
          expect(robot.orientation).to eq('WEST')
          robot.invoke(:right)
          expect(robot.orientation).to eq('NORTH')
        end
      end
    end
  end
end
