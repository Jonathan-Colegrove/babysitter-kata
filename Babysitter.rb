  def welcome
      puts "Hi, welcome to the babysitting rate calculator.
            Please enter your name."
      @name=gets.chomp
      return startingHour
  end

  def startingHour
      puts "Hi, #{@name}! When would you be starting?
            Please enter any hour from 5pm until 3am"
      @starting = gets.chomp.delete("^0-9[ ][aApP][mM]").to_i
      unless @starting <5
          return endingHour
      else
        puts "Sorry, what was that again?"
        return startingHour
      end
  end

  def endingHour
      puts "And when would you be babysitting until?
            Please enter any hour from 6pm until 4am"
      @ending = gets.chomp.delete("^0-9[ ][aApP][mM]").to_i
      #unless @ending >=4 && @ending>6
          return bedTime
      #else
      #  puts "Sorry, what was that again?"
      #  return endingHour
      #end
  end

  def bedTime
      puts "When do the children go to bed?"
      @bedTime=gets.chomp.delete("^0-9[ ][aApP][mM]").to_i
      puts "For every whole hour from:
                5pm until bedtime (#{@bedTime}), the rate is $12/hour.
                #{@bedTime} until midnight, the rate is $8/hr.
                midnight until 4am, the rate is $16/hr.
            There is no pay for incomplete hours."
            return hours
  end

  def hours
    case
    when @starting >=5 && @ending <= @bedTime
    puts "Your pay is $#{(@ending-@starting)*12}."

    when @starting >=@bedTime && @ending <= 12
    puts "Your pay is $#{(@ending-@starting)*8}."

    when @starting >=12 && @ending <= 4
    puts "Your pay is $#{(@ending-@starting)*16}."
    end
  end


welcome