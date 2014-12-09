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

      @program = reboot | query_info | query_time | answer_time
    end
  end
end

class String
  def hex_to_bitstring
    s = ""
    self.each_byte do |c|
      n = if c >= 48 && c <= 57 then
            c - 48
          elsif c >= 65 && c <= 70 then
            c - 65 + 10
          else
            raise "not hex string"
          end
      
      tmp = ""
      while n > 0 do
        tmp = (n % 2).to_s + tmp
        n = n / 2
      end
      tmp = "0" * (4 - tmp.length) + tmp

      s = s + tmp
    end
    s
  end
end
