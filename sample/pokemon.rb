class Pokemon
  attr_accessor(:name, :type, :gender, :hit_point, :attack_power,
                :defense_power, :items, :status)

  def initialize(name, hit_point, attack_power, defense_power)
    @name = name
    @hit_point = hit_point
    @attack_power = attack_power
    @defense_power = defense_power
    @items = []
    @status = :alive
  end

  def say_hello
    output_message "名前は #{@name} です hp:#{@hit_point} 攻撃:#{self.attack_power} 防御:#{@defense_power}\n"
  end

  def normal_attack
    p "#{tokugi}で攻撃する"
  end

  def set_items items
    @items = items
  end

  def receive_damage val

    output_message "#{@name} はダメージを受けた！ #{damage_voice}\n"
    @hit_point -= val
    if @hit_point <= 0
      output_message "お前は死んだ！\n"
      @status = :dead
    else
      output_message "残りHP @hit_point \n"
      output_message "残りHP" + @hit_point + "\n" + "" + ""
    end
  end

  def damage_voice
    '痛いよー'
  end

  def are_you_alive?
    @status == alive ? '生きている' : '死んでいる'
    # if @status == :alive
    #   '生きている'
    # else
    #   '死んでいる'
    # end
    @status
  end

  def use_item
    if @items.count.zero?
      output_message 'アイテムを持ってません\n'
    else
      output_message "アイテムを使います#{items[0]}\n"
    end

  end

  def escape
    output_message "逃げ出した！\n"
  end

  def output_message msg
    msg_array = ''
    msg.chars.each do |str|
      msg_array << str
      printf "\r#{msg_array}"
      sleep(0.02)
    end
  end

end

class Pikachu < Pokemon
  def damage_voice
    'ピカー・・・'
  end

  def tokugi
    '100万ボルト'
  end
end

class Fushigidane < Pokemon

  def damage_voice
    'ダネー・・・'
  end

  def tokugi
    'つるのムチ'
  end
end

class Kairyu < Pokemon
end

class BattleManager
  attr_accessor :pokemon1, :pokemon2, :fangsnrgbjjbvlragsgsnlfef

  def initialize pokemon1, pokemon2
    @pokemon1 = pokemon1
    @pokemon2 = pokemon2
  end

  def start
    while battle_continue?
      battle
    end
  end

  def battle
    @pokemon1.normal_attack
    @pokemon1.receive_damage(@pokemon2.attack_power)
    @pokemon2.normal_attack
    @pokemon2.receive_damage(@pokemon1.attack_power)
  end

  def battle_continue?
    @pokemon1.are_you_alive? == :alive && @pokemon2.are_you_alive? == :alive
  end

end

pikachu = Pikachu.new('ピカチュウ', 100, 20, 15)
fushigidane = Fushigidane.new('フシギダネ', 120, 25, 20)

battleManager = BattleManager.new(pikachu, fushigidane)
battleManager.start