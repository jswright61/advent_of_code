class RPS
  attr_reader :input

  def initialize
    @input = File.read("./input.txt").split("\n")
  end

  def score(plays)
    opp, mine = if plays.respond_to?(:split)
      plays.split(" ")
    else
      plays
    end
    # opp, mine = plays.strip.split(" ")
    case mine
    when "A", "X" # rock
      1 + case opp
      when "A" then 3 # rock rock
      when "B" then 0 # paper rock
      else; 6 # scissors rock
      end
    when "B", "Y" # paper
      2 + case opp
      when "A" then 6 # rock paper
      when "B" then 3 # paper paper
      else; 0 # scissors paper
      end
    else # C # scissors
      3 + case opp
      when "A" then 0 # rock scissors
      when "B" then 6 # paper scissors
      else; 3 # scissors scissors
      end
    end
  end

  def guess(plays)
      opp, result = if plays.respond_to?(:split)
      plays.split(" ")
    else
      plays
    end
    mine = case result
    when "X" # lose
      case opp
      when "A" then "C" # scissors
      when "B" then "A" # rock
      else; "B" # paper
      end
    when "Y" # draw
      case opp
      when "A" then "A" # rock
      when "B" then  "B" # paper
      else; "C" # scissors
      end
    else # Z # win
      case opp
      when "A" then "B" # paper
      when "B" then "C" # scissors
      else; "A" # rock
      end
    end
    [opp, mine]
  end

  def round_1
    scores = input.map {|i| score(i)}
    scores.sum
  end

  def round_2
    scores = input.map {|i| score(guess(i))}
    scores.sum
  end
end
