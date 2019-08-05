module CharacterAsciiArt
  def receive_damage_aa()
    raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
  end

  def attack_aa()
    raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
  end
end
