class CastingDirector
  attr_accessor :cast_list
  
  def initialize(actors, characters)
    @actors = actors
    @characters = characters
    @pairings = {}
    @cast_list = {}
  end

  def pair_each_actor_with_character
    actors = @actors.shuffle
    characters = @characters.shuffle
    actors.each.with_index do | actor, index |
        @pairings[actor] = characters[index]
        characters.delete_at(index)
    end
  end

  def build_cast_list
    @pairings.each do |character, actor|
      !@cast_list[actor] ?  @cast_list[actor] = [character] : @cast_list[actor].push(character)
    end
  end

#   def refine_cast_list
#     @actors.each do |actor|
#     #   if @cast_list.includes(actor)
#     end
#   end

  def cast_parts
    pair_each_character_with_actor
    build_cast_list
  end
end

actors = [
  'aysha',
  'arndrea',
  'colin',
  'sandra',
  'jessica'
]

characters = [
  'drew',
  'aryana',
  'ash', 
  'axel', 
  'jeff',
  'kennedy',
  'gabe',
  'anthony',
  'virginia',
  'alex'
]

casting_director = CastingDirector.new(actors, characters)

5.times do 
    casting_director.pair_each_actor_with_character
    # puts casting_director.pairings
    # casting_director.cast_parts
    # puts casting_director.cast_list
end
