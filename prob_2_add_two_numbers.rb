# You are given two linked lists representing two non-negative numbers.
# The digits are stored in reverse order and each of their nodes contain a single digit.
# Add the two numbers and return it as a linked list.

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

class Node
  attr_accessor :val, :next
  def initialize(val=nil, next_node=nil)
    @val = val
    @next = next_node
  end
end


def add_two_numbers(l1, l2)
  add_two_numbers_helper(l1, l2, 0)
end

def add_two_numbers_helper(l1, l2, carry)
  return nil if !l1 && !l2 && carry == 0

  sum = carry

  sum += l1.val if l1
  sum += l2.val if l2

  val = sum % 10
  carry = sum / 10

  node = Node.new(val)

  new_l1 = (l1 == nil) ? l1 : l1.next
  new_l2 = (l2 == nil) ? l2 : l2.next

  rest = add_two_numbers_helper(new_l1, new_l2, carry)

  node.next = rest

  return node
end

l1 = Node.new(0)
l2 = Node.new(0)
l3 = Node.new(5)
l4 = Node.new(5)
l5 = Node.new(7)

p add_two_numbers(l1, l2) # 0 => nil
p add_two_numbers(l3, l4) # 0 => 1 => nil
p add_two_numbers(l1, l3) # 5 => nil
p add_two_numbers(l3, l5) # 2 => 1 => nil