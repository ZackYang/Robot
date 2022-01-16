# frozen_string_literal: true

ENV['ENV'] ||= 'production'
require File.join(__dir__, 'application.rb').to_s

controller = CommandLineController.new

puts('Please use "PLACE X,Y,F" to place your robot')
puts("This robot accept following commands: \nMOVE\nLEFT\nMOVE\nREPORT")
puts('You can use "exit" to exit from the game:')
cmd = ''

while cmd.strip != 'exit'
  cmd = gets
  controller.exec(cmd)
end

puts('Bye')
