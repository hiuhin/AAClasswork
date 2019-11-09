def my_min
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  list.each_with_index do |ele, idx|
    return ele if list.all? {|num| ele <= num }  
  end
end

# p my_min


def my_min2(array)
  least = nil
  array.each do |ele|
    if least == nil || ele < least  
      least = ele
    end
  end
  return least
end

#p my_min2( [ 0, 3, 5, 4, -5, 10, 1, 90 ])

def largest_contiguous_subsum(list)
  answer=[]
  list.each_with_index do |ele,index|
    list.each_with_index do |ele2,index2|
      if index2 >= index 
        answer.push(list[index..index2])
      end
    end
  end
  answer.map {|array| array.sum}.max
end

# p largest_contiguous_subsum([5,3,-7, 9,5])

def largest_contiguous_subsum2(list)
  rolling = 0
  best = nil
  i = 0 
  while i < list.length
    variable = list[0..i].sum  
    unless variable < 0 
      rolling = variable 
    else
      rolling = 0
    end

    if best == nil || variable > best
      best = variable 
    end
    i+=1
  end

end

p largest_contiguous_subsum([5,3,-9, 2,0,-5])



