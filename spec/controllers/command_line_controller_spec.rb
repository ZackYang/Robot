# frozen_string_literal: true

describe CommandLineController do
  subject(:controller) { described_class.new(map, robot) }

  let(:robot) { double }
  let(:map) { double }

  before { allow(robot).to receive(:map=) }

  describe '#exec' do
    context 'when the command has no arguments' do
      let(:cmd) { 'do_something' }

      it 'calls invoke of the robot with do_something' do
        expect(robot).to receive(:invoke).with(:do_something)
        controller.exec(cmd)
      end
    end

    context 'when the command has multiple arguments' do
      let(:cmd) { 'do_something   1 , 2 , WEST' }

      it 'calls invoke of the robot with do_something' do
        expect(robot).to receive(:invoke).with(:do_something, 1, 2, 'WEST')
        controller.exec(cmd)
      end
    end
  end
end
