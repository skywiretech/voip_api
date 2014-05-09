module VoipApi

  class DIDList
    include Enumerable

    attr_reader :dids

    def initialize(dids=[])
      @dids = dids
    end

    def <<(new_element)
      @dids << new_element
      @dids.sort!
      self
    end

    def push(new_element)
      @dids.push(new_element)
    end

    def pop
      @dids.pop
    end

    def each(&block)
      @dids.each do |did|
        if block_given?
          block.call did
        else  
          yield did
        end
      end  
    end

  end
  
end
