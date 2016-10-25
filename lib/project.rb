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

  def initialize(v)
    @head = v
  end

  def add(n)
    new_node = if n.class != Node
                 Node.new(n)
               else
                 n
               end

    cur = head
    cur = cur.next until cur.next.nil?
    cur.next = new_node
  end

  def print_all
    cur = head
    loop do
      puts "Wartosc: #{cur.value}"
      break if cur.next.nil?
      cur = cur.next
    end
  end
end

xdd = Node.new(3)
lista = LinkedList.new(xdd)
lista.add(7)

lista.print_all
