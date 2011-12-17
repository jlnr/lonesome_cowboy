require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'metrics'
require 'window'

Dir['controllers/*.rb', 'models/*.rb'].sort.each do |file|
  require "./#{file}"
end

window = Window.new
Controller.root = GameController.new
window.show
