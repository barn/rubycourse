#!/usr/bin/ruby
#
require "profiler"

ATTEMPTS = 100000

puts "Try the until attempts method"

Profiler__.start_profile

attempts = 0

until attempts == ATTEMPTS
	attempts += 1
  print ""
end

Profiler__.stop_profile
Profiler__.print_profile($stdout)


puts "now the .times method"

Profiler__.start_profile

ATTEMPTS.times do  |attempts|
  print ""
end

Profiler__.stop_profile
Profiler__.print_profile($stdout)


