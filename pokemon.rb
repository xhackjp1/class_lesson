require './ascii_art'
require './pokemon'
require './battle_manager'
require './character_ascii_art'

class Pokemon
  include CharacterAsciiArt

  attr_accessor :name, :hitpoint, :attack, :defense

  def initialize(name:, hitpoint:, attack:, defense:)
    @name = name
    @hitpoint = hitpoint
    @attack = attack
    @defense = defense
  end

  def receive_damage val
    self.receive_damage_aa
    if val == 0
      print "#{name}は 攻撃をかわした！\n"
    else
      print "#{name}は #{val} のダメージ \n#{name}: グオオ！！\n"
      @hitpoint = @hitpoint - val
    end
  end

  def message_attack
    self.attack_aa
    print "#{name}の攻撃！\n行くぜ！！"
  end

end
