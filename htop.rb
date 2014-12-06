require 'reboot'
require 'query_info'

module htop
  def self.parse(content)
    input = Input.new(content, 0)
    op = Reboot.new
        | QueryInfo.new
        | At.new
    
    op.parse(input)
  end
end
