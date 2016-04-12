  def welcome
      puts "Hi, welcome to the babysitting rate calculator.
            Please enter your name."
      @name=gets.chomp
      return startingHour
  end

  def startingHour
      puts "Hi, #{@name}! What hour would you start on?
      Please enter any hour from 5pm until 3am
      (example: starting at 5:30pm you would enter '5').
      We'll take care of the minutes shortly."
      @startingH = gets.chomp.to_i

      puts "How many minutes after the starting hour would you start?
      (example: starting at 5:30pm you would enter '30'.
        Starting at 5pm enter '0'"
      @startingM = gets.chomp.to_i

      # to disallow inputting only a letter
      if @startingH==0 || @startingM==0
        puts "Sorry, what was that again?"
        return startingHour
      end
      @startingH>=5 && @startingH<=12 ? @startingH+=12 : @startingH+=24

      if @startingH<17 || @startingH>27
        puts "Sorry, what was that again?"
        return startingHour
      else return endingHour
      end
  end

  def endingHour
      puts "What hour would you end on? Please enter any hour from 6pm until 4am
      (example: ending at 10:30pm you would enter '10'.
        We'll take care of the minutes shortly)"
      @endingH = gets.chomp.to_i

      puts "How many minutes after the ending hour would you start?
        (example: ending at 10:30pm --> enter '30'.
          Ending at 10pm enter '0')"
      @endingM = gets.chomp.to_i

      @endingH>=1 && @endingH<=4 ? @endingH+=24 : @endingH+=12

    if @endingH>28 || @endingH<18
        puts "Sorry, what was that again?" 
     return endingHour
    else return bedTime
    end
  end

  def bedTime
    puts "What hour do the children go to bed at?
      (example: bedtime at 8:30pm you would enter '8'.
        We'll take care of the minutes shortly)"

      @bT=gets.chomp.to_i
      @bedTime=@bT
      @bedTime>=1 && @bedTime<=4 ? @bedTime+=24 : @bedTime+=12

    puts "How many minutes after the bedtime hour do the children go to bed?
      (example: bedtime at 8:30pm you would enter '30')"
      @bedTimeM=gets.chomp.to_i

    @bed = "#{@bT}" + ":" + "#{@bedTimeM}"

    if @bedTime>28 || @bedTime<17
        puts "Whoa, that's pretty late!
        Do you want to double-check & enter a bedtime between 5pm & 4am?" 
     return bedTime
    else return finalPay
    end
  end

def finalPay
  puts "For every whole hour from:
              5pm until bedtime (#{@bed}), the rate is $12/hour.
              #{@bed} until midnight, the rate is $8/hr.
              midnight until 4am, the rate is $16/hr.
          There is no pay for partial hours."

if @startingM+@endingM==60
  $payBeforeBedtime = ((@bedTime-@startingH)-(@startingM/60)+(@bedTimeM/60))*12
    if @endingH<=24
      $payAfterBedtime = ((@endingH-@bedTime)+(@endingM/60)-(@bedTimeM/60))*8
      else $payAfterBedtime = ((24-@bedTime)+(@endingM/60)-(@bedTimeM/60))*8
    end
  $payAfterMidnight = ((@endingH-24)+(@endingM/60))*16

else
  $payBeforeBedtime = (@bedTime-@startingH)*12
    if @endingH<=24
      $payAfterBedtime = (@endingH-@bedTime)*8
      else $payAfterBedtime = (24-@bedTime)*8
    end
  $payAfterMidnight = (@endingH-24)*16
end

    if @endingH<24 && @endingH<@bedTime
        then @finalPay=$payBeforeBedtime
    elsif @endingH<=24 && @endingH>@bedTime
        then @finalPay=$payBeforeBedtime+$payAfterBedtime
    else @finalPay = $payBeforeBedtime+$payAfterBedtime+$payAfterMidnight
    end
  puts "You will earn $#{@finalPay} for babysitting today!"
end

welcome