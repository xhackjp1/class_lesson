require 'ascii_art'
require 'pokemon'
require 'battle_manager'
require 'character_ascii_art'
require 'pikachu'
require 'kairyu'
require 'fushigidane'

RSpec.describe Pokemon do
  context "" do
    let :hp { defense * 2 }
    let :defense { 100 }
    let :heal_point { defense / 2 }
    let :pokemon { Pikachu.new(name: "", hitpoint: hp, attack: 0, defense: defense) }
    it "防御力の半分回復する" do
      expect{ pokemon.heal }.to change{ pokemon.hitpoint }.from(hp).to(hp + heal_point)
    end
  end
end
