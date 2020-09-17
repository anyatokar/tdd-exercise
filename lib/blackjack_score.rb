# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

# tallies up aces.
def aces_method(score, ace_count)

  if  ace_count == 1 && score <= 10
    score += 11
  elsif  ace_count == 2 && score <= 9
    score += 12
  elsif  ace_count == 3 && score <= 8
    score += 13
  elsif  ace_count == 4 && score <= 7
    score += 14
  else
    # takes advantage of length and 1 point per ace coincidence.
    # credit for this smart idea to Lina
    score += ace_count
  end
  return score

end

def blackjack_score(hand)

  if hand.length < 2
    raise ArgumentError.new("Too few cards. Pick at least #{3 - hand.length} more!")
  end
  #
  if hand.length > 5
    raise ArgumentError.new("Too many cards!")
  end
  #
  if hand.length > 5
    raise ArgumentError.new("Too many cards!")
  end

  score = 0
  hand.each do |card|
    if !(VALID_CARDS.include?(card))
      raise ArgumentError.new("Invalid card.")
    end

    case card
    when 2, 3, 4, 5, 6, 7, 8, 9, 10
      score += card
    when 'Jack', 'Queen', 'King'
      score += 10
    end
  end

    ace_count = hand.count("Ace")
    aces_score = aces_method(score, ace_count)

    if score > 21
      raise ArgumentError.new("Bust! Over 21!")
    end

  return aces_score
end
