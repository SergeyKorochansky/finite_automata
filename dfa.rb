class DFA

  def initialize(states, symbols, initial, acceptings)
    @states     = states
    @symbols    = symbols
    @initial    = initial
    @acceptings = acceptings
  end

  def process(inputs)
    s = @initial
    inputs.each_char { |i|
      s = s.process(i)
      return false unless s
    }

    @acceptings.include? s
  end

  def to_graph(options = {})
    g = GraphViz.new( :G, :type => :digraph )
    nodes = @states.map{ |s|
      if s == @initial
        g.add_nodes(s.to_s, :style => 'dashed')
      elsif @acceptings.include? s
        g.add_nodes(s.to_s, :peripheries => '2')
      end
      g.add_nodes(s.to_s)
    }

    transposed_states = {}
    @states.each_index { |i|
      transposed_states[@states[i]] = i
    }

    @states.each_index { |i|
      @states[i].function.each { |symbol, state|
        g.add_edges(nodes[i], nodes[transposed_states[state]], :label => symbol)
      }
    }

    options.empty? ? g.output(:dot => String) : g.output(options)

  end
end