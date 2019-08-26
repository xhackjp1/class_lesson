require 'ascii_art'
require 'pokemon'
require 'battle_manager'
require 'character_ascii_art'
require 'pikachu'
require 'kairyu'
require 'fushigidane'

RSpec.describe Pokemon do
  context "ポケモンのバトル中の動き" do
    let(:hp) { defense * 2 }
    let(:defense) { 100 }
    let(:heal_point) { defense / 2 }
    let(:pokemon) { Pikachu.new(name: "", hitpoint: hp, attack: 0, defense: defense) }
    it "一定確率で防御力の半分回復する" do
      expect{ pokemon.heal }.to change{ pokemon.hitpoint }.from(hp).to(hp + heal_point)
    end

    it "一定確率で逃げる、逃げるとHP 0 になる" do
      # expect(dog.name).to eq 'Pochi'
      expect{ pokemon.escape_from_battle }.to change{ pokemon.hitpoint }.to 0
    end
  end
end
