Class CastingDirector
  def initialize(actors:, characters:)
    @actors = actors.shuffle
    @characters = roles.shuffle
    @pairings = {}
    @cast_list = {}
  end

  def pair_each_character_with_actor
    @characters.each do |character|
      random_actor = @actors[rand(@actors.length)]
      @pairings[character] = random_actor
    end
  end

  def build_cast_list
    @pairings.each do |character, actor|
      !@cast_list[actor] ?  @cast_list[actor] = [character] : @cast_list[actor].push(character)
    end
  end

  def refine_cast_list
    @actors.each do |actor|
      if @cast_list.includes(actor)
    end
  end
end