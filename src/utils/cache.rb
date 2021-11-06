class Cache
  @store = {}
  class << self
    attr_reader :store


    def fetch(key, expires_in: 30, &block)
      if store.key?(key) && store[key][:expiration_time] > Time.now.to_i
        store[key][:value]
      else
        if block_given?
          store[key] = { value: yield(block), expiration_time: Time.now.to_i + expires_in }
          store[key][:value]
        else
          nil
        end
      end
    end

    def clear
      @store = {}
    end
  end
end
