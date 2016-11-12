## Notatki z Ruby, v2.3.1

Liczby są obiektami:

3.class #=> Fixnum

3.to_s #=> "3"

nil - null

Tablice

array = [1, 2, 3, 4, 5]

[1, 'hello', false]

Klasay

class Node
  attr_accessor :next, :value

  def initialize(v)
    @value = v
    @next = nil
  end
end

def initialize - konstruktor

Funkcje:

def name(arguments)

end

Pętle:
if else
  if head.nil?
      @head = n
    else
      getlast.next = n
    end

   cur = cur.next until cur.next.nil?
loop i break if
  loop do
      temp += 1
      break if cur.next.nil?
      cur = cur.next
    end

unless i skrócony if
    return unless cur.value == value
    !prev.nil? ? (prev.next = cur.next) : (@head = cur.next)



