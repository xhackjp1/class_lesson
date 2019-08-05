require './lib/ascii_art'
require './lib/pokemon'
require './lib/battle_manager'
require './lib/character_ascii_art'
require './lib/pikachu'
require './lib/kairyu'
require './lib/fushigidane'

def start
  pikachu = Pikachu.new(name: "ピカチュー", hitpoint: 500, attack: 185, defense: 100)
  kairyu = Kairyu.new(name: "カイリュー", hitpoint: 500, attack: 185, defense: 100)
  fushigidane = Fushigidane.new(name: "フシギダネ", hitpoint: 500, attack: 185, defense: 100)
  battleManager = BattleManager.new(pokemon1: pikachu, pokemon2: fushigidane)
  battleManager.start
end

start
