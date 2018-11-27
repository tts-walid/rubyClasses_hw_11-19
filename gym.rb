=begin
#OBJ - A gym has hired you to solve a problem.
#Most of their clients are fairly new to weightlifting
#The weights they have made available are in 45, 35, 25, 15, 10 and 5 lbs. increments.
#Build them a Ruby application that will tell them, for a given weight, what plates to put on each side of the bar.
#Bear in mind that the bar itself weighs 45 lbs.
#For example, if they want to load 225 lbs. on the bar, they will need to put two 45 lbs. plates on each side of the bar. 45x4 = 180 lbs. Plus 45 lbs. for the barbell itself equals a total of 225 lbs.
#Hint: You don't really need to create Objects for this one, so you get a break from that. But you will need to create methods!
=end

def how_much(amount)
  @weights = {}
  @lbs = amount - 45
  evaluator(@lbs)
end
def evaluator(arg)
  if arg - 90 >= 0
    fortyFive(arg)
  elsif arg - 70 >= 0
    thirtyFive(arg)
  elsif arg - 50 >= 0
    twentyFive(arg)
  elsif arg - 30 >= 0
    fifteen(arg)
  elsif arg - 20 >= 0
    ten(arg)
  elsif arg - 10 >= 0
    five(arg)
  elsif arg == 0
  @weights.each do |k,v|
    puts "You need #{v} #{k} plates."
  end
else puts "Sorry the weight you have chosen does not work. We currently don't have any 2.5 lb plates. #{@weights} #{arg}"
  end
end
def keyIncrementor(hash_key, arg)
  if @weights.has_key? hash_key
    value_holder = @weights[hash_key]
    value_holder += 2
    @weights[hash_key] = value_holder
  else
    @weights[hash_key] = 2
  end
    evaluator(arg)
end
def fortyFive(arg)
  arg -= 90
  keyIncrementor(45, arg)
end

def thirtyFive(arg)
  arg -= 70
  keyIncrementor(35, arg)
end

def twentyFive(arg)
  arg -= 50
  keyIncrementor(25, arg)
end
def fifteen(arg)
  arg -= 30
  keyIncrementor(15, arg)
end

def ten(arg)
  arg -= 20
  keyIncrementor(10, arg)
end

def five(arg)
  arg -= 10
  keyIncrementor(5, arg)
end

how_much(500)

# puts @weights
