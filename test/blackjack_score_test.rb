require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    score = blackjack_score(["Queen", "Jack"])
    expect(score).must_equal 20

    score = blackjack_score([3, "King"])
    expect(score).must_equal 13

  end

  it 'calculates aces as 11 where it does not go over 21' do

    score = blackjack_score(["Ace", "Jack"])
    expect(score).must_equal 21

    score = blackjack_score([3, "Ace", "Ace"])
    expect(score).must_equal 15

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

      score = blackjack_score(["Ace", 7])
      expect(score).must_equal 18

      score = blackjack_score(["Ace", "Ace"])
      expect(score).must_equal 12

  end

  it 'raises an ArgumentError for invalid cards' do

    expect {
      blackjack_score(["Ace", 4, 3, "Queen", "King", 5])
    }.must_raise ArgumentError

    expect {
      blackjack_score([4])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    expect {
      blackjack_score(["Ace", 4, 3, "Queen", "King", 5])
    }.must_raise ArgumentError

    expect {
      blackjack_score([10, 2, 9, 2])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for cards not in deck' do

    expect {
      blackjack_score([75, 2, 9, 2])
    }.must_raise ArgumentError

    expect {
      blackjack_score(["Queen", "cat", 9, 2])
    }.must_raise ArgumentError

  end

end
