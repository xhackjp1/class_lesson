require './ascii_art'
require './pokemon'
require './battle_manager'
require './character_ascii_art'

class BattleManager
  attr_accessor :pokemon1, :pokemon2, :turn, :effect_kaihi, :effect_critical, :attacker, :defender, :result

  def initialize(pokemon1:, pokemon2:)
    @pokemon1 = pokemon1
    @pokemon2 = pokemon2
    @turn = 1
    @random = Random.new
    @result = nil
  end

  def start
    print "#{@pokemon1.name} と #{@pokemon2.name} バトル開始だ！\n"
    print "#{@pokemon1.name} HP: #{@pokemon1.hitpoint} \n"
    print "#{@pokemon2.name} HP: #{@pokemon2.hitpoint} \n"
    max = 248
    count_up = 0

    if @random.rand > 0.5
      @attacker = @pokemon2
      @defender = @pokemon1
    else
      @attacker = @pokemon1
      @defender = @pokemon2
    end

    while !battle_end?
      next_turn
      sleep(1)
    end
  end

  def battle_result

    return if @pokemon1.hitpoint >= 0 && @pokemon2.hitpoint >= 0

    print "バトル終了！"
    if @pokemon1.hitpoint > @pokemon2.hitpoint
      @result = @pokemon1
      print "#{@pokemon1.name} の勝利！\n"
    else
      @result = @pokemon2
      print "#{@pokemon2.name} の勝利！\n"
    end
  end

  def next_turn

    if @attacker == @pokemon1
      @attacker = @pokemon2
      @defender = @pokemon1
    else
      @attacker = @pokemon1
      @defender = @pokemon2
    end

    battle

    battle_result

    print "ターン: #{@turn} 終了\n#{@pokemon1.name} 残HP:#{@pokemon1.hitpoint} - #{@pokemon2.name} 残HP:#{@pokemon2.hitpoint}\n"
    sleep(0.7)
    @turn += 1
  end

  def battle
    @attacker.message_attack
    sleep(1)
    @defender.receive_damage calc_damage(@defender, @attacker)
    sleep(1)
    show_data @defender
  end

  def calc_damage pokemon1, pokemon2
    # p @random.rand
    rate = 1.0

    if @random.rand > 0.7
      @effect_kaihi = :effect_kaihi
      return 0
    end

    if @random.rand > 0.7
      rate = 2
      @effect_critical = :effect_critical
    else
      @effect_critical = :normal
    end

    base = (pokemon1.attack / 2) - (pokemon2.defense / 4)
    (base * (@random.rand * 3) * rate).round(0)
  end

  def battle_end?
    @pokemon1.hitpoint < 0 || @pokemon2.hitpoint < 0
  end

  def show_data pokemon
    print "#{pokemon.name} 残りHP: #{pokemon.hitpoint}\n"
    # sleep(0.3)
  end
end