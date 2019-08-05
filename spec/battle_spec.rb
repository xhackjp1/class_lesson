require 'ascii_art'
require 'pokemon'
require 'battle_manager'
require 'character_ascii_art'
require 'pikachu'
require 'kairyu'
require 'fushigidane'

RSpec.describe BattleManager do
  it "" do
    @pikachu = Pikachu.new(name: "ピカチュー", hitpoint: 500, attack: 185, defense: 100)
    @kairyu = Kairyu.new(name: "カイリュー", hitpoint: 500, attack: 185, defense: 100)
    @fushigidane = Fushigidane.new(name: "フシギダネ", hitpoint: 500, attack: 185, defense: 100)
    @battleManager = BattleManager.new(pokemon1: @pikachu, pokemon2: @fushigidane)
    @battleManager.start
  end
end
