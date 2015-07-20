# Given an array of integers, find two numbers such that they add up to a specific target number.

# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

# You may assume that each input would have exactly one solution.

# Input: numbers={2, 7, 11, 15}, target=9
# Output: index1=1, index2=2

# SOLUTION 1: 0(n^2) running time and 0(1) space
def two_sum(nums, target)
  len = nums.length
  for i in (0...len)
    element = nums[i]
    for j in (i+1...len)
      if element + nums[j] == target
        puts "index1=#{i+1}, index2=#{j+1}"
        return
      end
    end
  end

end

# SOLUTION 2: 0(nlogn) running time and 0(1) space complexities
def two_sum_2(nums, target)
  sorted_nums = merge_sort(nums)
  i, j = 0, sorted_nums.length-1
  while i < j
    sum = sorted_nums[i] + sorted_nums[j]
    if sum == target
      index1 = nums.index(sorted_nums[i])
      index2 = nums.index(sorted_nums[j])
      puts "index1=#{index1+1}, index2=#{index2+1}"
      return
    elsif sum < target
      i += 1
    else
      j -= 1
    end
  end
end

# Writing the merge_sort function - 0(n longn) running time
def merge_sort(nums)
  len = nums.length
  return nums if len < 2
  mid_index = len / 2

  left_sorted = merge_sort(nums[0...mid_index])
  right_sorted = merge_sort(nums[mid_index...len])
  merge(left_sorted, right_sorted)
end

def merge(left_array, right_array)
  result = []

  while left_array.length > 0 && right_array.length > 0
    if left_array[0] < right_array[0]
      result << left_array.shift
    else
      result << right_array.shift
    end
  end

  result += left_array + right_array
end
################ End of merge sort #####

# SOLUTION 3 - 0(n) running time and 0(n) space complexities
def two_sum_3(nums, target)
  len = nums.length
  hash = {}

  for i in (0...len)
    elt = nums[i]
    diff = target - elt
    # check to see if diff is in the hash; if so we found 2 numbers that add up to sum, that is diff and elt
    if hash[diff]
      index1 = nums.index(diff)
      puts "index1=#{index1+1}, index2=#{i+1}"
      return
    else
      hash[elt] = 1 # add the key elt to the hash
    end
  end
end



# TEST DRIVE

puts "Testing Solution 1 - 0(n^2) running time and 0(1) space:"
two_sum([2, 7, 11, 15], 9)
two_sum([1, 4, 45, 6, 10, 8], 16)
puts "\n"

puts "Testing Solution 2 - 0(nlogn) running time and 0(1) space:"
two_sum_2([2, 7, 11, 15], 9)
two_sum_2([1, 4, 45, 6, 10, 8], 16)
puts "\n"

puts "Testing Solution 3 - 0(n) running time and 0(n) space:"
two_sum_3([2, 7, 11, 15], 9)
two_sum_3([1, 4, 45, 6, 10, 8], 16)
puts "\n"