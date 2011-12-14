#
# Setup Awesome Print the default irb output
#
begin
  require "awesome_print"
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue
  puts "Can't load Awesome Print"
end

#
# Require all .rb files in current dir
#
files = Dir.glob("*.rb")

unless files.empty?
  print "Require #{files.to_s}? [Y/n] "
  
  if /y|yes|^$/i === gets.strip
    files.each { |file| require "./#{file}" }
  end
end


#
# 'im': interesting methods
#
class Object
  def im(er=nil)
    methods = (self.methods - Object.methods).sort
    er ? methods.grep(er) : methods
  end
end

#
# Get module classes
#
class Module
  def classes
    constants.map { |sym| const_get(sym) if const_get(sym).is_a? Class }.compact
  end
end

require 'interactive_editor' rescue puts "Can't load Interactive Editor"

IRB.conf[:PROMPT][:SIMPLE][:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

puts "\n\033[0;32m#{RUBY_DESCRIPTION}\033[0m" # print in green
