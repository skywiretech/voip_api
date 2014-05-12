module VoipApi

  class DIDList
    include Enumerable

    attr_reader :collection

    def initialize(collection=[])
      @collection = collection
    end

    def <<(new_element)
      @collection << new_element
      @collection.sort!
      self
    end

    def push(new_element)
      @collection.push(new_element)
    end

    def pop
      @collection.pop
    end

    def each(&block)
      @collection.each do |collectable|
        if block_given?
          block.call collectable
        else  
          yield collectable
        end
      end  
    end

  end
  
end
