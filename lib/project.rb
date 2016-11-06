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
end

node1 = Node.new(3)
node2 = Node.new(60)
lista2 = LinkedList.new
lista2.add(node1)
lista2.add(7)
lista2.push_front(50)
lista2.add(43)
lista2.add(node2)
puts "Pop_front test: #{lista2.pop_front}"
puts "Value at 0: #{lista2.value_at(0)}"
puts "Pop_back test: #{lista2.pop_back}"
puts "Value at 2: #{lista2.value_at(2)}"
puts "Length of list: #{lista2.size}"
puts "Is list empty: #{lista2.empty}"
puts "Is 0 in list?: #{lista2.in_list?(0)}"
