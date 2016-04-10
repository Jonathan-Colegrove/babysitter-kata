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
          if @starting<17
            then @starting+=12
          end
      unless @starting<17
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
      if @ending<12
        then @ending+=12
      end
      #unless @ending>=18 && @ending<=28
          return bedTime
      #else
       # puts "Sorry, what was that again?"
      #  return endingHour
     # end
  end

  def bedTime
      puts "When do the children go to bed?"
      @bedTime=gets.chomp.delete("^0-9[ ][aApP][mM]").to_i
      if @bedTime<12
        then @bedTime+=12
      end
      puts "For every whole hour from:
                5pm until bedtime (#{@bedTime-12}), the rate is $12/hour.
                #{@bedTime-12} until midnight, the rate is $8/hr.
                midnight until 4am, the rate is $16/hr.
            There is no pay for incomplete hours."
  #    return hours
  return finalPay
  end


def finalPay
  $payBeforeBedtime = (@ending-@starting)*12
  $payAfterBedtime = (24-@bedTime)*8
  #28= 4am (24hr day + 4hrs)
  $payAfterMidnight = (28-@ending)*16

  @finalPay = $payBeforeBedtime+$payAfterBedtime+$payAfterMidnight
  puts "Your will earn $#{@finalPay} for babysitting today!"
end


 # def hours
 #   case
 #   when @starting>=17 && @ending<=@bedTime
 #   puts "Your pay is $#{(@ending-@starting)*12}."

 #   when @starting>=@bedTime && @ending<=12
 #   puts "Your pay is $#{(@ending-@starting)*8}."

 #   when @starting>=24 && @ending<=4
 #   puts "Your pay is $#{(@ending-@starting)*16}."
 #   end
 # end


welcome