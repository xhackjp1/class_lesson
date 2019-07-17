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
      output_message "#{name}は 攻撃をかわした！\n"
    else
      output_message "#{name}は #{val} のダメージ #{name}: グオオ！！\n"
      @hitpoint = @hitpoint - val
    end
  end

  def message_attack
    self.attack_aa
    output_message "#{name}の攻撃！行くぜ！！"
  end

  def output_message msg
    msg_array = ""
    msg.chars.each do |str|
      msg_array << str
      printf "\r#{msg_array}"
      sleep(0.02)
    end
  end

end
