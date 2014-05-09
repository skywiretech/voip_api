module VoipApi

  class DIDLocatorList
    include Enumerable

    attr_reader :did_locators

    def initialize(did_locators=[])
      @did_locators = did_locators
    end

    def <<(new_element)
      @did_locators << new_element
      @did_locators.sort!
      self
    end

    def push(new_element)
      @did_locators.push(new_element)
    end

    def pop
      @did_locators.pop
    end

    def each(&block)
      @did_locators.each do |did|
        if block_given?
          block.call did
        else  
          yield did
        end
      end  
    end

  end
  
end
