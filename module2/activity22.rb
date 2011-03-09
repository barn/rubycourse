#!/usr/bin/ruby
#

require 'pp'

array1 = [1, 2, 3, 4]
array2 = %w{peter piper picked peppers}
array3 = []

# You need to write some code in this part
# to make the program output "Success"

array3 = array1.map { |x| x.to_s }.zip( array2 ).flatten

if array3 == ['1', 'peter', '2', 'piper', '3', 'picked', '4', 'peppers']
  puts "Success"
else
  puts "Failed"
end

