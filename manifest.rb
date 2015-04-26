#!/usr/bin/ruby -w
t = Time.new
timestamp = t.year, t.month, t.day, t.hour, t.min, t.sec
open('cache.manifest', 'w') do |fo|
  fo.puts "CACHE MANIFEST"
  fo.puts "# Version #{timestamp}"
  fo.puts "CACHE:"
  array = Dir["./**/*"].select{|f| !File.directory? f}
  array.each do |i|
    fo.puts "#{i}".gsub(/^\./, "")
  end
end