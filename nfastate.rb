class NFAState
  attr_accessor :function
  attr_reader :name

  def initialize(name = 'dummy')
    @name = name
    @function = {}
  end

  def to_s
    'NS: ' + @name
  end

  def has_move?(input)
    @function.key?(input)
  end

  def <=>(o)
    @name <=> o.name
  end

end