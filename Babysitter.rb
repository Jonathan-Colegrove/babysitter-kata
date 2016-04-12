  def welcome
      puts "Hi, welcome to the babysitting rate calculator.
            Please enter your name."
      @name=gets.chomp
      return startingHour
  end

  def startingHour
      puts "Hi, #{@name}! When would you be starting?
            Please enter any hour from 5pm until 3am"
      @starting = gets.chomp.to_i
      # to disallow inputting only a letter
      if @starting==0
        puts "Sorry, what was that again?"
        return startingHour
      end
      @starting>=5 && @starting<=12 ? @starting+=12 : @starting+=24

      if @starting<17 || @starting>27
        puts "Sorry, what was that again?"
        return startingHour
      else return endingHour
      end
  end

  def endingHour
      puts "And when would you be babysitting until?
            Please enter any hour from 6pm until 4am"
      @ending = gets.chomp.to_i
      @ending>=1 && @ending<=4 ? @ending+=24 : @ending+=12

    if @ending>28 || @ending<18
        puts "Sorry, what was that again?" 
     return endingHour
    else return bedTime
    end
  end

  def bedTime
      puts "When do the children go to bed?"
      @bed=gets.chomp
      @bedTime=@bed.to_i
      @bedTime>=1 && @bedTime<=4 ? @bedTime+=24 : @bedTime+=12

    if @bedTime>28 || @bedTime<17
        puts "Whoa, that's pretty late! Do you want to double-check & enter a bedtime between 5pm & 4am?" 
     return bedTime
    else return finalPay
    end
  end

def finalPay
  puts "For every whole hour from:
              5pm until bedtime (#{@bed}), the rate is $12/hour.
              #{@bed} until midnight, the rate is $8/hr.
              midnight until 4am, the rate is $16/hr.
          There is no pay for incomplete hours."

  $payBeforeBedtime = (@bedTime-@starting)*12
  
  if @ending<=24
    $payAfterBedtime = (@ending-@bedTime)*8
  else $payAfterBedtime = (24-@bedTime)*8
  end

  $payAfterMidnight = (@ending-24)*16

    if @ending<24 && @ending<@bedTime
        then @finalPay=$payBeforeBedtime
    elsif @ending<=24 && @ending>@bedTime
        then @finalPay=$payBeforeBedtime+$payAfterBedtime
    else @finalPay = $payBeforeBedtime+$payAfterBedtime+$payAfterMidnight
    end
  puts "You will earn $#{@finalPay} for babysitting today!"
end

welcome