Pry.config.editor = "subl ."

Pry.config.prompt = proc do |obj, level, _|
  prompt = "\e[1;30m"
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})>\e[0m "
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

if defined?(Rails)
  require "rails/console/app"
  require "rails/console/helpers"
  TOPLEVEL_BINDING.eval("self").extend ::Rails::ConsoleMethods
end

begin
  require "awesome_print"
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}
rescue LoadError => err
  puts "=> Unable to load awesome_print"
end

