class DFAState
  attr_accessor :function
  attr_accessor :number
  attr_reader   :name
  class << self
    attr_accessor :count
  end
  @count = 0
  #@function = nil

  def initialize(name = 'dummy')
    @name = name
    self.class.count += 1
    @number = self.class.count
  end

  def to_s
    #'DS: ' + @name
    @number.to_s
  end

  def process(input)
    @function[input]
  end

  def <=>(o)
    @name <=> o.name
  end
end