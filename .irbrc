#!/usr/bin/ruby
require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"


# Show results of all extension-loading
puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE}) #{RUBY_PLATFORM}"


require 'pry'
Pry.start
exit
