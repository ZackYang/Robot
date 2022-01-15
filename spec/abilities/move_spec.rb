# frozen_string_literal: true

class TestRobotMove < Robots::Base
  extend Abilities
  include Abilities::Place
  include Abilities::Move
end

describe Abilities::Move do
  let(:map) { Map::TableTop.new }
  let(:robot) { TestRobotMove.new }

  describe '#_execute_ability_move' do
    context 'when robot does not been assigned a map' do
      it 'does not changes the x, y and orientation' do
        robot.invoke(:move)
        expect(robot.x).to eq(nil)
        expect(robot.y).to eq(nil)
        expect(robot.orientation).to eq(nil)
      end
    end

    context 'when robot does been assigned a 5x5 map' do
      before { robot.map = map }

      context 'when place the robot in the border' do
        before { robot.invoke(:place, x, y, orientation) }

        context 'when robot still can move forward to the east' do
          let(:x) { 2 }
          let(:y) { 2 }
          let(:orientation) { 'EAST' }

          it 'does move' do
            robot.invoke(:move)
            expect(robot.x).to eq(3)
            expect(robot.y).to eq(2)
            expect(robot.orientation).to eq('EAST')
          end
        end

        context 'when robot still cannot move forward to the west' do
          let(:x) { 2 }
          let(:y) { 2 }
          let(:orientation) { 'WEST' }

          it 'does move' do
            robot.invoke(:move)
            expect(robot.x).to eq(1)
            expect(robot.y).to eq(2)
            expect(robot.orientation).to eq('WEST')
          end
        end

        context 'when robot still cannot move forward to the south' do
          let(:x) { 2 }
          let(:y) { 2 }
          let(:orientation) { 'SOUTH' }

          it 'does move' do
            robot.invoke(:move)
            expect(robot.x).to eq(2)
            expect(robot.y).to eq(1)
            expect(robot.orientation).to eq('SOUTH')
          end
        end

        context 'when robot still cannot move forward to the north' do
          let(:x) { 2 }
          let(:y) { 2 }
          let(:orientation) { 'NORTH' }

          it 'does move' do
            robot.invoke(:move)
            expect(robot.x).to eq(2)
            expect(robot.y).to eq(3)
            expect(robot.orientation).to eq('NORTH')
          end
        end
      end

      context 'when place the robot on the border' do
        before { robot.invoke(:place, x, y, orientation) }

        context 'when robot still cannot move forward to the east' do
          let(:x) { 4 }
          let(:y) { 0 }
          let(:orientation) { 'EAST' }

          it 'does not move' do
            robot.invoke(:move)
            expect(robot.x).to eq(4)
            expect(robot.y).to eq(0)
            expect(robot.orientation).to eq('EAST')
          end
        end

        context 'when robot still cannot move forward to the west' do
          let(:x) { 0 }
          let(:y) { 0 }
          let(:orientation) { 'WEST' }

          it 'does not move' do
            robot.invoke(:move)
            expect(robot.x).to eq(0)
            expect(robot.y).to eq(0)
            expect(robot.orientation).to eq('WEST')
          end
        end

        context 'when robot still cannot move forward to the north' do
          let(:x) { 4 }
          let(:y) { 4 }
          let(:orientation) { 'NORTH' }

          it 'does not move' do
            robot.invoke(:move)
            expect(robot.x).to eq(4)
            expect(robot.y).to eq(4)
            expect(robot.orientation).to eq('NORTH')
          end
        end

        context 'when robot still cannot move forward to the south' do
          let(:x) { 0 }
          let(:y) { 0 }
          let(:orientation) { 'SOUTH' }

          it 'does not move' do
            robot.invoke(:move)
            expect(robot.x).to eq(0)
            expect(robot.y).to eq(0)
            expect(robot.orientation).to eq('SOUTH')
          end
        end
      end
    end
  end
end
