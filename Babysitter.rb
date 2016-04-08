  def welcome
      puts "Hi, welcome to the babysitting rate calculator.
            Please enter your name."
      @name=gets.chomp
      return startingHour
  end

  def startingHour
      puts "Hi, #{@name}! When would you be starting?
            Please enter any hour from 5pm until 3am (in whole hours only)"
      @starting = gets.chomp
      return endingHour
  end

  def endingHour
      puts "And when would you be babysitting until?
            Please enter any hour from 6pm until 4am (in whole hours only)"
      @ending = gets.chomp
      return bedTime
  end

  def bedTime
      puts "When do the children go to bed?"
      @bedTime=gets.chomp
      puts "For every whole hour from:
                5pm until bedtime (#{@bedTime}), the rate is $12/hour.
                #{@bedTime} until midnight, the rate is $8/hr.
                midnight until 4am, the rate is $16/hr.
            There is no pay for parts of an hour."
            return hours
  end

  def hours
    case
    when @starting.delete("^0-9").to_i >=5 && @ending.delete("^0-9").to_i <= @bedTime.delete("^0-9").to_i
    puts "Your pay is $#{(@ending.to_i-@starting.to_i.to_i)*12}"

    when @starting.delete("^0-9").to_i >=@bedTime.delete("^0-9").to_i && @ending.delete("^0-9").to_i <= 12
    puts "Your pay is $#{(@ending.to_i-@starting.to_i)*8}"

    when @starting.delete("^0-9").to_i >=12 && @ending.delete("^0-9").to_i <= 4
    puts "Your pay is $#{(@ending.to_i-@starting.to_i)*16}"
    end
  end


welcome