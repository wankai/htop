module Htop

  class AnswerTime
    OPCODE = 0x6174

    UNKNOWN = 0x0000
    ACCURATE_TIME = 0xFFFF
   
    def initialize(status, timestamp)
      @status = status
      @timestamp = timestamp
    end

    def to_s
      if @status == UNKNOWN then
        "unkown time"
      else
       @timestamp.to_s
      end
    end
  end

end
