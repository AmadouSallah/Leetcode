# Given a string, find the length of the longest substring without repeating characters.
# For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.

def longest_substring_without_repeating_characters(string)
  len = string.length
  return len if len < 2

  i, j, max = 0, 0, 0
  hash = {}
  while i < len && j < len
    char = string[j]
    if !hash[char] # the current character is non repeating
      hash[char] = 1
      diff = j-i+1
      max = (max > diff) ? max : diff
      j += 1
    else # the current character is repeating
      hash[char] = nil # remove it from hash
      diff = j-i
      max = (max > diff) ? max : diff
      i += 1
    end
  end
  max
end

p longest_substring_without_repeating_characters("abcabcbb") == 3
p longest_substring_without_repeating_characters("bbbbb") == 1
p longest_substring_without_repeating_characters("abc") == 3
p longest_substring_without_repeating_characters("a") == 1
p longest_substring_without_repeating_characters("") == 0
p longest_substring_without_repeating_characters("abbay") == 3
