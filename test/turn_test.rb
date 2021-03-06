require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)

    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)
  end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_type_can_be_basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_type_can_be_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:club, 'Queen', 12)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_type_can_be_MAD

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:club, 'Queen', 12)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_there_can_be_a_winner_of_basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner

  end

  def test_there_can_be_a_winner_of_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:club, 'Queen', 12)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner


    assert_equal player1, winner

  end

  def test_there_can_be_no_winner_of_MAD
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:club, 'Queen', 12)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end


  def test_cards_can_be_piled_basic

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    assert_equal [], turn.spoils_of_war
    turn.pile_cards

    assert_equal [card1, card4], turn.spoils_of_war
  end

  def test_cards_can_be_piled_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:spade, 'Queen', 12)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:club, 'Queen', 12)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    assert_equal [], turn.spoils_of_war
    turn.pile_cards

    assert_equal [card1, card2, card3, card4, card5, card6], turn.spoils_of_war
  end

  def test_cards_cannot_be_piled_MAD
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:club, 'Queen', 12)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Ace', 14)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [], turn.spoils_of_war
  end

  def test_spoils_can_be_awarded_basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    assert_equal [], turn.spoils_of_war
    turn.pile_cards
    turn.award_spoils(turn.winner)

    winner_deck = [card1, card2, card3, card4,]

    assert_equal 4, turn.winner.deck.cards.length
  end

  def test_spoils_can_be_awarded_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:spade, 'Queen', 12)
    card4 = Card.new(:diamond, '4', 4)

    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)

    card5 = Card.new(:club, 'Queen', 12)
    card6 = Card.new(:heart, '8', 8)
    card7 = Card.new(:diamond, 'Ace', 14)
    card8 = Card.new(:diamond, '5', 5)

    cards2 = [card5, card6, card7, card8]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
    winner = turn.winner
    assert_equal 4, player2.deck.cards.length
    assert_equal 4, player1.deck.cards.length
    turn.pile_cards
    assert_equal 1, player2.deck.cards.length
    assert_equal 1, player1.deck.cards.length
    turn.award_spoils(winner)

    assert_equal 1, player1.deck.cards.length
    assert_equal 7, player2.deck.cards.length

  end

  def test_cards_can_be_awarded_MAD
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:spade, 'Ace', 14)
    card4 = Card.new(:diamond, '4', 4)

    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)

    card5 = Card.new(:club, 'Queen', 12)
    card6 = Card.new(:heart, '8', 8)
    card7 = Card.new(:diamond, 'Ace', 14)
    card8 = Card.new(:diamond, '5', 5)

    cards2 = [card5, card6, card7, card8]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
    winner = turn.winner
    assert_equal 4, player2.deck.cards.length
    assert_equal 4, player1.deck.cards.length
    turn.pile_cards
    assert_equal 1, player2.deck.cards.length
    assert_equal 1, player1.deck.cards.length
    turn.award_spoils(winner)

    assert_equal 1, player1.deck.cards.length
    assert_equal 1, player2.deck.cards.length
  end
end
