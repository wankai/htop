module Htop

  class Reboot
    OPCODE = 0x7262

    def initialize(code)
      @code = code
    end

    def to_s
      "reboot"
    end
  end

end
