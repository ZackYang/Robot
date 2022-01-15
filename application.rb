# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/object/blank'
require 'pry'

class Application
  ROOT_PATH = __dir__

  def self.root
    Application::ROOT_PATH
  end
end

Dir["#{Application.root}/app/**/*.rb"].sort.each do |file|
  require file
end
