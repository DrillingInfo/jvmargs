module JVMArgs
  class NonStandard
    attr_accessor :key, :value
    
    def initialize(arg)
      stripped = arg.sub(/^-/, '')
      stripped =~ /(X[a-z]+:?)([0-9]+[a-zA-Z])?/
      if $2.nil?
        @key = $1 
        @value = stripped[@key.length..-1] # could be an empty string
      else
        @key = $1
        @value = JVMArgs::Util.convert_to_m($2)
        # value is a kilobyte value < 1 MB after conversion
        if @value == "0M"
          @value = JVMArgs::Util.normalize_units($2).join('')
        end
      end
    end
    
    def to_s
      "-J-#{@key}#{@value}"
    end
  end
end
