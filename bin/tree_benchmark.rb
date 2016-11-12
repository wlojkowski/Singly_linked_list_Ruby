require 'benchmark'
require_relative '../lib/project'

Benchmark.bm() do |x|
  array = [3, 2, 1, 5]

  list = LinkedList.new(4)

  list.add(4)
  list.add(19)
  list.add(44)

  puts '#constructors'
  x.report('init array') { [] }
  x.report('init linked list with argument') { LinkedList.new(4) }
  x.report('init linked list without argument') { LinkedList.new }
  puts '#add'

  x.report('add to array') { array.push(5) }
  x.report('add to list') { list.add(1) }
  puts '#front'
  x.report('get first element from array') { array.first }
  x.report('get first element from list') { list.front }
  puts '#getlast'
  x.report('get last element from array') { array.last }
  x.report('get last element from list') { list.getlast }
  puts '#size'
  x.report('get size of array') { array.length }
  x.report('get size of list') { list.size }
  puts '#in_list?'
  x.report('check if an item is included in the array') { array.include?(3) }
  x.report('check if an item is included in the list') { list.in_list?(19) }
  puts '#empty'
  x.report('check if array is empty') { array.empty? }
  x.report('check if lsit is empty') { list.empty }
  puts '#push_front'
  x.report('add an item to the beginning of the array') { array.unshift(0) }
  x.report('add an item to the beginning of the list') { list.push_front(0) }
  puts '#pop_front'
  x.report('remove an item from the beginning of the array') { array.shift }
  x.report('remove an item from the beginning of the list') { list.pop_front }
  puts '#pop_back'
  x.report('remove an item from the end of the array') { array.pop }
  x.report('remove an item from the end of the list') { list.pop_back }
  puts '#getnode_at'
  x.report('get element at index from the array') { array[2] }
  x.report('get element at index from the list') { list.getnode_at(2) }
  puts '#insert_at'
  x.report('insert element at index into the array') { array.insert(3, 5) }
  x.report('insert element at index into the list') { list.insert_at(3, 5) }
  puts '#erase'
  x.report('delete element at index from the array') { array.delete_at(3) }
  x.report('delete element at index from the list') { list.erase(3) }
  puts '#reverse'
  x.report('reverse array') { array.reverse! }
  x.report('reverse list') { list.reverse_list }
  puts '#remove_value'
  x.report('remove an element by value from array') { array.delete(5) }
  x.report('remove an element by value from list') { list.remove_value(18) }
end
