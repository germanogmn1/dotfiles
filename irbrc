require 'irb/completion'
require 'irb/ext/save-history'

def force_require_gem(gem_name)
  begin
    if defined?(Rails)
      require Bundler.with_clean_env { `gem which #{gem_name}`.strip }
    else
      require gem_name
    end
    true
  rescue Exception => e
    puts "Failed to require #{gem_name}"
    false
  end
end

if force_require_gem('awesome_print')
  class IRB::Irb
    def output_value
      ap @context.last_value, indent: 2, index: false, limit: 100
    end
  end
end

if force_require_gem('hirb')
  Hirb.enable
end

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

IRB.conf[:PROMPT][:MIN] = {
  :PROMPT_I => ">> ",
  :PROMPT_N => nil,
  :PROMPT_S => nil,
  :PROMPT_C => ">> ",
  :RETURN => "# => %s\n",
  :AUTO_INDENT => true
}
IRB.conf[:PROMPT_MODE] = :MIN

class Object
  # Interesting methods
  def im(er=nil)
    methods = (self.public_methods - Object.instance_methods).sort
    er ? methods.grep(er) : methods
  end

  # Local methods
  def lm(er=nil)
    methods = (self.public_methods - self.class.superclass.instance_methods).sort
    er ? methods.grep(er) : methods
  end
end

class Module
  # Get module classes
  def classes
    constants.map { |sym| const_get(sym) }.select { |obj| obj.is_a? Class }
  end
end

# Ruby version in green
puts "\033[0;32m#{RUBY_DESCRIPTION}\033[0m"
