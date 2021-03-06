class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max) {false}
    @max = max
  end

  def insert(num)
    if num > @max || num < 0 
      raise "Out of bounds"
    else 
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
   # @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end
end






class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets

    unless self.include?(num) 
      self[num] << num
      @count += 1
    end
    
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
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
        bucket.each do |num|
          temp_store[num % (num_buckets * 2)] << num
        end
      end
    
      @store = temp_store
  end
end
