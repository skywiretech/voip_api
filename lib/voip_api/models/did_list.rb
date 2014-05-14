module VoipApi

  # Contains a list of sortable, enumerable DID related elements
  # @attr [Array] collection An array of the collectable DID-like elements
  class DIDList
    include Enumerable

    attr_reader :collection

    # @!visibility private
    def initialize(collection=[])
      @collection = collection
    end

    # @!visibility private
    def <<(new_element)
      @collection << new_element
      @collection.sort!
      self
    end

    # Pushes a new item onto the collection
    def push(new_element)
      @collection.push(new_element)
    end

    # Removes an item off the back of the collection
    def pop
      @collection.pop
    end

    # Allows iterating over the collection
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
