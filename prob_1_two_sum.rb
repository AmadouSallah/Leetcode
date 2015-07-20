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

# TEST DRIVE

puts "Testing Solution 1 - 0(n^2) running time and 0(1) space:"
two_sum([2, 7, 11, 15], 9)
two_sum([1, 4, 45, 6, 10, 8], 16)
puts "\n"