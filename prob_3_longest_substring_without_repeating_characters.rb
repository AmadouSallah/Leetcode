# Given a string, find the length of the longest substring without repeating characters.
# For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.

def longest_substring_without_repeating_characters(string)
  len = string.length
  return len if len < 2

  i, j, max = 0, 0, 0
  hash = {}

  while j < len
    char = string[j]

    if !hash[char] # if current character is a non repeating one
      hash[char] = 1
      j += 1
    else # We found a repeating character, therefore the substring up to the previous character might be the longest non repeating, so we update max
      diff = j-i
      max = (max > diff) ? max : diff

      # Assume that the repeated character appeared at index k, where i <= k < j (i.e. s[k] = s[j]), therefore we set nil all the hash values of the characters from i to k
      while string[i] != string[j]
        hash[string[i]] = nil
        i += 1
      end

      # Now increment both i and j to get ready for the next substring
      i += 1
      j += 1
    end
  end

  # Update max
  diff = len - i
  max = (max > diff) ? max : diff

  return max
end

p longest_substring_without_repeating_characters("abcabcbb") == 3
p longest_substring_without_repeating_characters("bbbbb") == 1
p longest_substring_without_repeating_characters("abc") == 3
p longest_substring_without_repeating_characters("a") == 1
p longest_substring_without_repeating_characters("") == 0
p longest_substring_without_repeating_characters("abbay") == 3
p longest_substring_without_repeating_characters("pwwkew") == 3

