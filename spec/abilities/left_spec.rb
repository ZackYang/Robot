# frozen_string_literal: true

class TestRobotLeft < Robots::Base
  extend Abilities
  include Abilities::Left
end

describe Abilities::Left do
  let(:map) { Map::TableTop.new }
  let(:robot) { TestRobotLeft.new }

  describe '#_execute_ability_left' do
    context 'when robot does not been assigned a map' do
      it 'does not change the orientation' do
        robot.invoke(:left)
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

        it 'changes the orientation to west, south, east and north' do
          robot.invoke(:left)
          expect(robot.orientation).to eq('WEST')
          robot.invoke(:left)
          expect(robot.orientation).to eq('SOUTH')
          robot.invoke(:left)
          expect(robot.orientation).to eq('EAST')
          robot.invoke(:left)
          expect(robot.orientation).to eq('NORTH')
        end
      end
    end
  end
end
