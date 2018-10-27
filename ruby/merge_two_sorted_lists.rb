def merge_two_sorted_lists(l1, l2)
  dummy_head = tail = Node.new

  while !l1.is_empty && !l2.is_empty
    if l1.data < l2.data
      tail.next, l1 = l1, l1.next
    else
      tail.next, l2 = l2, l2.next
    end
  end

  tail.next = l1.is_empty? ? l2 : l1
  return dummy_head.next
end
