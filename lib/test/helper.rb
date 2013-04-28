require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'test/unit'
require 'shoulda'
require 'nostalgia'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
                                        :database => File.dirname(__FILE__) + "/nostalgia.sqlite3")

ActiveRecord::Schema.define do
  self.verbose = false
  create_table :posts, :force => true do |t|
    t.string :column
  end
end

class Test::Unit::TestCase
end

