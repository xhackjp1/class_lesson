class BattleManager
  attr_accessor :pokemon1, :pokemon2, :turn, :effect_kaihi, :effect_critical, :attacker, :defender, :result

  def initialize(pokemon1:, pokemon2:)
    @pokemon1 = pokemon1
    @pokemon2 = pokemon2
    @turn = 1
    @random = Random.new
    @result = nil
  end

  def heal

  end

  def start
    output_message "#{@pokemon1.name} と #{@pokemon2.name} バトル開始だ！\n"
    sleep(0.3)
    output_message "#{@pokemon1.name} HP: #{@pokemon1.hitpoint} \n"
    sleep(0.3)
    output_message "#{@pokemon2.name} HP: #{@pokemon2.hitpoint} \n"
    sleep(1)
    puts "\e[H\e[2J"

    if @random.rand > 0.5
      @attacker = @pokemon2
      @defender = @pokemon1
    else
      @attacker = @pokemon1
      @defender = @pokemon2
    end

    while !battle_end?(@pokemon1.hitpoint, @pokemon2.hitpoint)
      next_turn
      sleep(1)
      puts "\e[H\e[2J"
    end
  end

  def battle_result

    return if @pokemon1.hitpoint > 0 && @pokemon2.hitpoint > 0

    print "バトル終了！"
    if @pokemon1.hitpoint > @pokemon2.hitpoint
      @result = @pokemon1
      @pokemon1.attack_aa
      output_message "#{@pokemon1.name} の勝利！\n"
    else
      @result = @pokemon2
      @pokemon2.attack_aa
      output_message "#{@pokemon2.name} の勝利！\n"
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

    if heal?(@random.rand)
      @attacker.heal
    elsif escape_from_battle?(@random.rand)
      @attacker.escape_from_battle
    else
      battle
    end

    puts "\e[H\e[2J"

    battle_result

    output_message "ターン: #{@turn} 終了\n"
    sleep(0.2)
    output_message "#{@pokemon1.name} 残HP:#{@pokemon1.hitpoint}\n"
    sleep(0.2)
    output_message "#{@pokemon2.name} 残HP:#{@pokemon2.hitpoint}\n"
    sleep(0.4)
    @turn += 1
  end

  def heal?(rate)
    rate > 0.5
  end

  def escape_from_battle?(rate)
    rate > 0.5
  end

  def battle
      @attacker.message_attack
      sleep(1)
      puts "\e[H\e[2J"
      @defender.receive_damage calc_damage(@defender, @attacker)
      sleep(1)
      show_data @defender
      sleep(1)
      puts "\e[H\e[2J"
  end

  def calc_damage pokemon1, pokemon2
    rate = 1.0

    if @random.rand > 0.85
      @effect_kaihi = :effect_kaihi
      return 0
    end

    if @random.rand > 0.6
      rate = 1.2
      @effect_critical = :effect_critical
    else
      @effect_critical = :normal
    end

    base = (pokemon1.attack / 2) - (pokemon2.defense / 4)
    (base * (@random.rand * 3.5) * rate).round(0)
  end

  def battle_end?(pokemon1_hp, pokemon2_hp)
    pokemon1_hp <= 0 || pokemon2_hp <= 0
  end

  def show_data pokemon
    output_message "#{pokemon.name} 残りHP: #{pokemon.hitpoint}\n"
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
