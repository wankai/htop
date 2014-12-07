require 'binp'

class Reboot
  def initialize(code)
    @code = code
  end

  def to_s
    "reboot"
  end
end

class QueryInfo
  def initialize(code)
    @code = code
  end

  def to_s
    "query_info"
  end
end

class HtopParser < Binp::Parser
  def initialize
    # assume reboot's opcode is 0x61
    reboot = Binp::Bytes.new(0x61) { |code| Reboot.new(code) }

    # assume query_info's opcode is 0x62
    query_info = Binp::Bytes.new(0x62) { |code| QueryInfo.new(code) }

    # assume cpu support only the two opcode now
    @program = reboot | query_info
  end
end

parser = HtopParser.new
puts parser.parse("b")  # ascii of 'b' is 0x62
# => would print "query_info"
