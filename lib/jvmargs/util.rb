module JVMArgs
  module Util

    def self.get_system_ram_k
      require 'ohai'
      ohai = Ohai::System.new
      ohai.require_plugin "linux::memory"
      total_ram = (ohai["memory"]["total"].sub(/kB/,'').to_i * 0.4).to_i
    end

    def convert_to_k(number)
      puts 'foo'
      # measure = 
      # case measure
      # end
    end
    
  end
end
