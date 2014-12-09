require 'binp'
require 'htop/reboot'
require 'htop/query_info'
require 'htop/query_time'
require 'htop/answer_time'

module Htop
  class Parser < Binp::Parser
    def initialize

      reboot = Binp::Bytes.new(0x72, 0x62) { |code| Reboot.new(code) }

      query_info = Binp::Bytes.new(0x71, 0x69) { |code| QueryInfo.new(code) }

      query_time = Binp::Bytes.new(0x71, 0x74) { |code| QueryTime.new(code) }

      answer_time = Binp::Bytes.new(0x61, 0x74) { |code| AnswerTime.new(code) }

      @program = reboot | query_info #| query_time | answer_time
    end
  end
end

class String
  def hex_to_bytestring
    raise "invalid hex string" if self.length % 2 != 0

    s = ""
    idx = 0
    prefix = 0
    self.each_byte do |c|
      n = if c >= 48 && c <= 57 then
            c - 48
          elsif c >= 65 && c <= 70 then
            c - 65 + 10
          else
            raise "not hex string"
          end

      if idx % 2 == 1 then
        s = s  << (prefix * 16 + n)
        prefix = 0
      else
        prefix = n
      end
      idx = idx + 1
    end
    s
  end
end
