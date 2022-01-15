# frozen_string_literal: true

class TestRobotReport < Robots::Base
  extend Abilities
  include Abilities::Report
end

describe Abilities::Report do
  let(:map) { Map::TableTop.new }
  let(:robot) { TestRobotReport.new }

  describe '#_execute_ability_report' do
    context 'when robot has no map' do
      it 'output "Output: ,,\n"' do
        expect do
          robot.invoke(:report)
        end.to output("Output: ,,\n").to_stdout
      end
    end

    context 'when robot has a map' do
      before { robot.map = map }

      context 'when robot has not been placed on the map' do
        it 'output "Output: ,,\n"' do
          expect do
            robot.invoke(:report)
          end.to output("Output: ,,\n").to_stdout
        end
      end

      context 'when robot has been placed on the map' do
        before do
          robot.x = 3
          robot.y = 4
          robot.orientation = 'WEST'
        end

        it 'output "Output: ,,\n"' do
          expect do
            robot.invoke(:report)
          end.to output("Output: 3,4,WEST\n").to_stdout
        end
      end
    end
  end
end
