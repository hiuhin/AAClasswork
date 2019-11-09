def first_anagram?(string1,string2) #O(n * n!) + O(n!) 
  return string1.split("").permutation.to_a.include?(string2.split(""))
end

# p first_anagram?("elvis","lives")
# p first_anagram?("gizmo","sally")

def second_anagram?(string1,string2) #n^2
  string1.each_char do |char|
    return false if !string2.include?(char)
    idx = string2.split("").index(char)
    string2[idx] = ""
  end

  return true if string2.empty?
  false
end

# p second_anagram?("elvis","lives")
# p second_anagram?("gizmo","sally")

def third_anagram?(string1,string2)
  string1.split("").sort == string2.split("").sort
end

# p third_anagram?("elvis","lives")
# p third_anagram?("gizmo","sally")


def fourth_anagram?(string1,string2) #n 
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  string1.each_char { |char| hash1[char] += 1}
  string2.each_char { |char| hash1[char] -= 1}
  return hash1.values.all? {|ele| ele == 0}
end
# p fourth_anagram?("elvis","lives")
# p fourth_anagram?("gizmo","sally")




#TWO SUM PROBLEM

def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |first|
    (first+1...arr.length).each do |last|
      if arr[first] + arr[last] == target_sum
        return true
      end
    end
  end
  false
end

# arr = [0,1,5,7]
# p bad_two_sum?(arr,6)
# p bad_two_sum?(arr,10)


def okay_two_sum?(arr,target)
  sorted = arr.sort
  i = 0 
  j = arr.length-1
  while j > i
    if arr[i]+arr[j] > target
      j = j - 1
    elsif arr[i]+arr[j] < target
      i = i + 1
    else
      return true
    end
  end
  false
end

arr = [0,1,5, 5, 7]
p okay_two_sum?(arr,6)
p okay_two_sum?(arr,10)

def good_two_sum?(array,target)
  hash = Hash.new(0)
  array.each {|ele| hash[ele] += 1}
  hash.keys.each {|key| return true if hash.has_key?(target-key) && (key != target - key || hash[key] > 1 ) }
  return false
end
p good_two_sum?(arr,6)
p good_two_sum?(arr,10)