class CardGenerator
  def initialize(csv)
    file = csv
  end

  def cards

  end
end

class Card
  attr_reader :input, :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank 
  end
end


# card_generator = [2, 'Heart', 2],
# [3, 'Heart', 3],
# [4, 'Heart', 4],
# [5, 'Heart', 5],
# [6, 'Heart', 6],
# [7, 'Heart', 7],
# [8, 'Heart', 8],
# [9, 'Heart', 9],
# [10, 'Heart', 10],
# [Jack, 'Heart', 11],
# [Queen, 'Heart', 12],
# [King, 'Heart', 13],
# [Ace, 'Heart', 14]

#card_generator.each do |item|