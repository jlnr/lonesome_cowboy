require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'core_ext'
require 'metrics'
require 'hints'
require 'window'

# "Forward declarations" that can be used as base classes
class GameObject
end

Dir['controllers/*.rb', 'models/*.rb'].sort.each do |file|
  require "./#{file}"
end

window = Window.new
Controller.root = GameController.new
window.show
