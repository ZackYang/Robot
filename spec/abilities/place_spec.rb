# frozen_string_literal: true

class TestRobotPlace < Robots::Base
  extend Abilities
  include Abilities::Place
end

describe Abilities::Place do
  let(:map) { Map::TableTop.new }
  let(:robot) { TestRobotPlace.new }

  describe '#_execute_ability_place' do
    context 'when robot does not been assigned a map' do
      it 'does not changes the x, y and orientation' do
        robot.invoke(:place, 0, 0, 'WEST')
        expect(robot.x).to eq(nil)
        expect(robot.y).to eq(nil)
        expect(robot.orientation).to eq(nil)
      end
    end

    context 'when robot does been assigned a 5x5 map' do
      before { robot.map = map }

      context 'when place the robot in border' do
        let(:x) { 0 }
        let(:y) { 1 }

        context 'when place the robot with an incorrect orientation' do
          let(:orientation) { 'WRONG' }

          it 'does not changes the x, y and orientation' do
            robot.invoke(:place, x, y, orientation)
            expect(robot.x).to eq(nil)
            expect(robot.y).to eq(nil)
            expect(robot.orientation).to eq(nil)
          end
        end

        context 'when place the robot with an correct orientation' do
          let(:orientation) { 'WEST' }

          it 'does not changes the x, y and orientation' do
            robot.class.ability_list
            robot.invoke(:place, x, y, orientation)
            expect(robot.x).to eq(x)
            expect(robot.y).to eq(y)
            expect(robot.orientation).to eq('WEST')
          end
        end
      end

      context 'when place the robot out of the border' do
        let(:x) { 7 }
        let(:y) { 5 }
        let(:orientation) { 'WEST' }

        it 'does not changes the x, y and orientation' do
          robot.class.ability_list
          robot.invoke(:place, x, y, orientation)
          expect(robot.x).to eq(nil)
          expect(robot.y).to eq(nil)
          expect(robot.orientation).to eq(nil)
        end
      end
    end
  end
end
