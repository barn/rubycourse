#!/usr/bin/ruby
#

def rand_between( low , high )
  rand( high - low + 1 ) + low
end

def read_number( string="Number? " )

  print string
  num = gets.chomp

  unless num =~ /^[0-9]+$/
    puts "Sorry, you don't seem to understand numbers. Lets try again"
    return read_number( string )
  end

  num = num.to_i

  case 
    when num < 0
      puts "number too low"
    when num > 2**30 - 1
      puts "Yeah, lets not be silly"
    else
      return num
  end

  # functional programming for the win.
  read_number( string )
end


n = read_number( "How many numbers do you want? " )
a = read_number( "How small can this number be? " )
b = read_number( "And how big can this number be? " )

n.times do
  puts rand_between(a, b) 
end
