class Team
  attr_accessor :name, :seed
  def initialize(arg1, arg2)
    @name = arg1
    @seed = arg2
  end
end

class Tournament
  #The initialize method isn't taking any arguments, but when it is called it is going to create a new Array that will store the teams the user provides and then calls the build_out method
  def initialize
    @team_creator = Array.new
    build_out
  end

  def build_out
    #This variable is what we are using to exit the program when the user types exit
    tourney = false
    puts "Welcome to My Tournament Generator. Enter a Selection:
    Type 'exit' when finished."
    until tourney == true
      print "Enter Team: "
      teams = gets.chomp
      if teams.downcase == "exit"
        tourney = true
        break
      end
      print "Seed: "
      seeds = gets.chomp.to_i
      Team.new(teams, seeds)
      @team_creator << [seeds, teams]
      puts "Seed assigned."
    end
    organize(@team_creator)
  end
  def organize(team)
    team.sort! do |a,b|
      a[0] <=> b[0]
    end
    bye(team)
  end
  def bye(team_arr)
    puts "Matchups:"
    if team_arr.count.odd?
      team1 = team_arr.shift
      puts "(#{team1[0]}) #{team1[1]} have a bye"
    end
    matchups(team_arr)
  end
  def matchups(team_arr)
    until team_arr.empty?
      team1 = team_arr.shift
      team2 = team_arr.pop
      puts "(#{team1}) #{team1[1]} versus (#{team2[0]}) #{team2[1]}"
    end
  end
end

Tournament.new
