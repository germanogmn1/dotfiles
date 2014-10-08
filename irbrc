require 'irb/completion'
require 'irb/ext/save-history'

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

class Method
  def edit!(editor = :vim)
    raise 'no source location' if source_location.nil?
    arg = case editor
    when :vim then source_location.join(' +')
    when :subl then source_location.join(?:)
    else raise 'no such editor'
    end
    system("#{editor} #{arg}")
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
