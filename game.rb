#!/usr/bin/env ruby

# Eww, global variables.
MAX_NUMBER = 100
MIN_NUMBER = 1
MAX_GUESSES = 10


def game( name )

  computers_number = rand(MAX_NUMBER - MIN_NUMBER + 1) + MIN_NUMBER
  puts "Hello #{name}. I'm guessing a number between #{MIN_NUMBER} and #{MAX_NUMBER}."
  puts "You need to guess the number. I will tell you if you are too low or too high."

  guesses = 0
  start_time = Time.new

  loop do

    puts "What is your guess?"
    guess = gets.chomp

    # see if they want a clue, keep going forever until they enter something that isn't a clue.
    if guess.downcase == "clue"
      puts "Well... it could end with #{  computers_number % 10 }"
      next
    end

    # now we don't have to worry about it being "clue" convert it to an int
    guess = guess.to_i

    # some polite error checking as it's only a game.
    if guess < MIN_NUMBER
      puts "Silly, needs to be above #{MIN_NUMBER}, try again!"
      next
    elsif guess > MAX_NUMBER
      puts "Silly, needs to be below #{MAX_NUMBER}, try again!"
      next
    end

    # now compare what they guessed with what we have.
    if guess < computers_number
      puts "Your guess was too low!"
    elsif guess > computers_number
      puts "Your guess was too high!"
    else

      time_diff = Time.now - start_time 

      # I use 1.8.7 as my system ruby, but 1.9.7 has extended Float#round
      if RUBY_VERSION == "1.9.2"
        time_diff = time_diff.round( 2 )
      end

      puts "You got the number right! It was #{computers_number}."
      puts "You took #{ time_diff } seconds."
      return
    end

    # as we start from zero, inc this before comparing it.
    guesses += 1

    if guesses >= MAX_GUESSES
      puts "Too many guesses!"
      return 1  # may as well return something different in this case.
    end

  end

end



# Main game loop.
def mainloop

  print "Hello player. What is your name? "
  name = gets.chomp

  game( name )

  loop do

    print "Would you like to play again? "
    if /^y/.match( gets.chomp.downcase )
      game( name )
    else
      puts "Bye!"
      exit
    end
  end

end

if ($0 == __FILE__)
  mainloop
end
