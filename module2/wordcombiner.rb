#!/usr/bin/ruby
#

# section one
puts "section 1"

input = "book bus car plaNe"

input = input.split( /[\s,]/ )  # split on whitespace or comma

input.each do |x|
  input.each do |y|
    puts "#{x}#{y}"
  end
end

# section two and three
puts "section 2 & 3"

input.each do |x|
  input.each do |y|
    puts "#{x}#{y}".downcase unless x == y
  end
end

# section four
puts "section 4"

input.uniq.each do |x|
  input.uniq.each do |y|
    puts "#{x}#{y}" 
  end
end

# section five
puts "section 5"

other_input = %w{fish cake hamster goat}

input.uniq.each do |x|
  other_input.uniq.each do |y|
    puts "#{x}#{y}" 
  end
end
