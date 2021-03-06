
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new(:first, nil)
    @tail = Node.new(:last, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    next_node = Node.new(key, val)
    current_last_node = @tail.prev
    next_node.next = @tail
    next_node.prev = current_last_node
    @tail.prev = next_node
    current_last_node.next = next_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each(&prc)
    node = []
    i = 1
    while i <= last.val
      node << prc.call(i)
      i += 1
    end   
    node
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
