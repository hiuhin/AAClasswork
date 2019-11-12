class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    resize! if @count == num_buckets

    unless self.include?(key) 
      self[num] << key
      @count += 1
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    num = key.hash
    if self[num].include?(key)
      self[num].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |key|
        num = key.hash
        temp_store[num % (num_buckets * 2)] << key
      end
    end
    
      @store = temp_store
  end
  
end