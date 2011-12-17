require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'core_ext'
require 'metrics'
require 'window'

# "Forward declaration" so that it can be used as a base class.
class GameObject
end

Dir['controllers/*.rb', 'models/*.rb'].sort.each do |file|
  require "./#{file}"
end

window = Window.new
Controller.root = GameController.new
window.show
