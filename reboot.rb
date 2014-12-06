module htop
  class RebootParser
    def initialize(&blk)
      @parser = BitsParser.new(Reboot::OPCODE, blk)
    end
    
    def parse(input)
      r = @parser.parse(input)
    end
    
    def to_s
      "reboot parser"
    end
  end
  
  class Reboot
    OPCODE = 0x0716
    
    def to_s
      "reboot"
    end
  end
end
