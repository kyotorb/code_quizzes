# by default, rspec only loads lib/ into the path, not the root project directory
$LOAD_PATH << File.expand_path('..', File.dirname(__FILE__))

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  # config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end