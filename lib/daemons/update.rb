#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  
  # Replace this with your code
  # Rails.logger.auto_flushing = true
  # Rails.logger.info "This daemon is still running at #{Time.now}.\n"
  puts "Updating at #{Time.now}.\n"


  page = Nokogiri::HTML(open("salacampus_2_semana02.html"))
  Schedule.build(page)

  sleep (3600 * 24 * 7)
end
