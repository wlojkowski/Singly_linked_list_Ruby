# Node
class Node
  attr_accessor :next, :value

  def initialize(v)
    @value = v
    @next = nil
  end

  def print_value
    puts " Wartosc : #{value}"
  end
end
# LinkedList
class LinkedList
  attr_accessor :head

  def add(n)
    n = Node.new(n) if n.class != Node
    if head.nil?
      @head = n
    else
      getlast.next = n
    end
  end

  def getlast
    cur = head
    cur = cur.next until cur.next.nil?
    cur
  end

  def print_all
    cur = head
    loop do
      puts "Wartosc: #{cur.value}"
      break if cur.next.nil?
      cur = cur.next
    end
  end

  def size
    temp = 0
    cur = head
    return 0 if empty
    loop do
      temp += 1
      break if cur.next.nil?
      cur = cur.next
    end
    temp
  end

  def in_list?(n)
    cur = head
    n = n.value if n.class == Node
    loop do
      return true if n == cur.value
      break if cur.next.nil?
      cur = cur.next
    end
    false
  end

  def value_at(n)
    cur = head
    return nil if size <= n
    loop do
      break if n <= 0
      n -= 1
      cur = cur.next
    end
    cur.value
  end

  def empty
    if head.nil?
      true
    else
      false
    end
  end

  def push_front(v)
    v = Node.new(v) if v.class != Node
    v.next = head
    @head = v
  end

  def pop_front
    temp = head
    @head = head.next
    temp.value
  end

  def pop_back
    cur = head
    loop do
      break if cur.next.next.nil?
      cur = cur.next
    end
    temp = cur.next
    cur.next = nil
    temp.value
  end

  def front
    if @head.nil?
      nil
    else
      @head.value
    end
  end

  def back
    cur = head
    cur = cur.next until cur.next.nil?
    cur.value
  end

  def getnode_at(index)
    cur = head
    return nil if size <= index
    loop do
      break if index <= 0
      index -= 1
      cur = cur.next
    end
    cur
  end

  def insert_at(value, index)
    value = Node.new(value) if value.class != Node
    cur = getnode_at(index - 1)
    return if cur.nil?
    temp = cur.next
    cur.next = value
    cur.next.next = temp
  end

  def erase(index)
    cur = getnode_at(index - 1)
    return if cur.nil?
    cur.next = cur.next.next
  end

  def value_n_from_end(n)
    index = size + 1 - n
    getnode_at(index).value
  end

  def reverse_list
    cur = head
    prev = nil
    loop do
      break if cur.nil?
      nxt = cur.next
      cur.next = prev
      prev = cur
      cur = nxt
    end
    @head = prev
  end

  def getnode_byvalue(v)
    prev = nil
    cur = head
    loop do
      break if v == cur.value || cur.next.nil?
      prev = cur
      cur = cur.next
    end
    prev
  end

  def remove_value(value)
    prev = getnode_byvalue(value)
    cur = prev.next
    return unless cur.value == value
    !prev.nil? ? (prev.next = cur.next) : (@head = cur.next)
  end
end
