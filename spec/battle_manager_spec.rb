require 'ascii_art'
require 'pokemon'
require 'battle_manager'
require 'character_ascii_art'
require 'pikachu'
require 'kairyu'
require 'fushigidane'

RSpec.describe BattleManager do

   before {
     @battleManager = BattleManager.new(pokemon1: @pikachu, pokemon2: @fushigidane)
   }

  # it "" do
  #   @pikachu = Pikachu.new(name: "ピカチュー", hitpoint: 500, attack: 185, defense: 100)
  #   @kairyu = Kairyu.new(name: "カイリュー", hitpoint: 500, attack: 185, defense: 100)
  #   @fushigidane = Fushigidane.new(name: "フシギダネ", hitpoint: 500, attack: 185, defense: 100)
  #   @battleManager.start
  # end

  it "healの閾値をテストする" do
    expect(@battleManager.heal?(0.49)).to eq(false)
    expect(@battleManager.heal?(0.51)).to eq(true)
  end

  it "escape_from_battleの閾値をテストする" do
    expect(@battleManager.escape_from_battle?(0.49)).to eq(false)
    expect(@battleManager.escape_from_battle?(0.51)).to eq(true)
  end

  it "バトル終了をテストする" do
    expect(@battleManager.battle_end?(10, 10)).to eq(false)
    expect(@battleManager.battle_end?(0, 10)).to eq(true)
    expect(@battleManager.battle_end?(10, 0)).to eq(true)
    expect(@battleManager.battle_end?(0, 0)).to eq(true)
    expect(@battleManager.battle_end?(-1, 10)).to eq(true)
    expect(@battleManager.battle_end?(10, -1)).to eq(true)
    expect(@battleManager.battle_end?(-1, -1)).to eq(true)
  end
end
