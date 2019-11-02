require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        #debugger
        return if self.parent == parent 
        self.parent.children.delete(self) if self.parent
        #p self.parent
        @parent = parent
        self.parent.children << self if !self.parent.nil? 
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise "not a child node" if child.parent == nil 
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            check = child.dfs(target)
            return check if check != nil
        end
        nil
    end
    
    def bfs(target)
        queue = []

        queue << self

        until queue.empty?
            node = queue.shift
            return node if node.value == target
            node.children.each { |child| queue << child}
        end

        nil

    end
end