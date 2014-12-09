module Htop

  class QueryTime
    OPCODE = 0x7174

    def initialize(code)
      @code = code
    end

    def to_s
      "query_time"
    end
  end

end
