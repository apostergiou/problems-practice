def remove(head, k)
  lnode = knode = head
  counter = 1

  while counter <= k do
    knode = head.next
    counter += 1
  end

  while knode.next != nil do
    knode = knode.next
    lnode = lnode.next
  end

  if knode.nil?
    head.next = head.next.next
    return
  end

  lnode.next = lnode.next.next
end
