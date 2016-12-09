class WheelOfFortune
  attr_reader :theme, :guesses

  def initialize(arg)
    @theme = arg[:theme]
    @phrase = arg[:phrase]
    @guesses = []
  end

  def unguessed
    @guesses
  end


  def to_s
    @phrase.split('').map! do |ele|
      @guesses.include?(ele.downcase) || ele == ' ' ? ele : ele = "_"
    end.join('')
  end

  def can_i_have?(input)
   phrase = @phrase.downcase
   input = input.downcase
   @guesses << input
   phrase.include? input
 end

 def game_over?
     !to_s.split('').include?("_")
   end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
