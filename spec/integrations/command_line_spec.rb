# frozen_string_literal: true

describe 'A series of commands', type: :feature do
  subject(:controller) { CommandLineController.new }

  let(:commands) do
    [
      'PLACE 0,0,EAST',
      'MOVE',
      'MOVE',
      'MOVE',
      'MOVE',
      'MOVE',
      'MOVE',
      'LEFT',
      'MOVE',
      'MOVE',
      'MOVE',
      'MOVE',
      'MOVE',
      'RIGHT',
      'RIGHT',
      'RIGHT',
      'MOVE',
      'REPORT'
    ].freeze
  end

  it 'runs a series of commands and report the result' do
    expect do
      commands.each do |cmd|
        controller.exec(cmd)
      end
    end.to output("Output: 3,4,WEST\n").to_stdout
  end
end
