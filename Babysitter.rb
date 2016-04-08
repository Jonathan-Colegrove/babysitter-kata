  def welcome
      puts "Hi, welcome to the babysitting rate calculator.
            Please enter your name."
      @name=gets.chomp
      return startingHour
  end

  def startingHour
      puts "Hi, #{@name}! When would you be starting?
            Please enter any hour from 5pm until 3am (in whole hours only)"
      starting = gets.chomp
      return endingHour
end

  def endingHour
      puts "And when would you be babysitting until?
            Please enter any hour from 6pm until 4am (in whole hours only)"
      ending = gets.chomp
  end


welcome