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
      @starting>=5 && @starting<=12 ? @starting+=12 : @starting+=24
      
      unless @starting<17
              #need to make sure partial hours ex.- 5:30 won't enter as 530, which is >27
              #unless @starting<17 || @starting>27
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
      @ending>=1 && @ending<=4 ? @ending+=24 : @ending+=12

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
      @bedTime>=1 && @bedTime<=4 ? @bedTime+=24 : @bedTime+=12


    # @bedTime<1 ? @bedTime+=12 : @bedTime+=24
    # if @bedTime<12
     #   then @bedTime+=12
    #elsif @bedTime>=1 && @bedTime<=4
    #    then @bedTime+=24
    #  end
  return finalPay
  end


def finalPay
    puts "For every whole hour from:
              5pm until bedtime (#{@bedTime-12}), the rate is $12/hour.
              #{@bedTime-12} until midnight, the rate is $8/hr.
              midnight until 4am, the rate is $16/hr.
          There is no pay for incomplete hours."
  $payBeforeBedtime = (@bedTime-@starting)*12
  $payAfterBedtime = @ending<=24 ? (@ending-@bedTime)*8 : (24-@bedTime)*8
  $payAfterMidnight = (@ending-24)*16

    if @ending<24 && @ending<@bedTime
        then @finalPay=$payBeforeBedtime
    elsif @ending<=24 && @ending>@bedTime
        then @finalPay=$payBeforeBedtime+$payAfterBedtime
    else @finalPay = $payBeforeBedtime+$payAfterBedtime+$payAfterMidnight
    end
  puts "Your will earn $#{@finalPay} for babysitting today!"
end

welcome