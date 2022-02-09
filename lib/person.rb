class Person
  # include ActiveModel::Validations

  attr_reader :name, :bank_account, :happiness, :hygiene
  attr_accessor :bank_account

  # validates :happiness, inclusion: { in: 0..10 }

  def initialize(name)
    @name = name
    @bank_account = 25
    @happiness = 8
    @hygiene = 8
  end

  def happiness=(level)
    if level < 0
      @happiness = 0
    elsif level > 10
      @happiness = 10
    else
      @happiness = level
    end
  end

  def hygiene=(level)
    if level < 0
      @hygiene = 0
    elsif level > 10
      @hygiene = 10
    else
      @hygiene = level
    end
  end

  def happy?
    @happiness > 7 ? true : false
  end

  def clean?
    @hygiene > 7 ? true : false
  end

  def get_paid(amount)
    self.bank_account += amount
    "all about the benjamins"
  end

  def take_bath
    self.hygiene += 4
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.happiness += 2
    self.hygiene -= 3
    "♪ another one bites the dust ♫"
  end

  def call_friend(friend)
    self.happiness += 3
    friend.happiness += 3
    "Hi #{friend.name}! It's #{self.name}. How are you?"
  end

  def start_conversation(friend, topic)
    if topic == "politics"
      self.happiness -= 2
      friend.happiness -= 2
      "blah blah partisan blah lobbyist"
    elsif topic == "weather"
      self.happiness += 1
      friend.happiness += 1
      "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end
end
