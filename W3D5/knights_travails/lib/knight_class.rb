require_relative "./00_tree_node.rb"

class KnightPathFinder

    #attr_reader :considered_positions
    
    POSSIBLE = [
        [-2, -1],
        [-2, 1],
        [2, -1],
        [2, 1],
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2]
    ]
    
    def initialize(pos)
        @start = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        valids = []
        POSSIBLE.each do |pair|
            x, y = (pos[0]+ pair[0]), (pos[1] + pair[1])

            if x >= 0 && x <= 7 && y >= 0 && y <= 7
                valids << [x,y]
            end
        end
        valids #
    end

    def new_move_positions(pos)
        all_possible = KnightPathFinder.valid_moves(pos) #<- returns valid array
        new_valid = all_possible - @considered_positions 
        @considered_positions += new_valid
        new_valid 
    end

    def build_move_tree
        
    end

end
