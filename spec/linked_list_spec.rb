require 'simplecov'
SimpleCov.start

require 'project'

RSpec.describe 'project.rb' do
  describe '#node' do
    it 'should be defined' do
      expect { Node.new(3) }.not_to raise_error
    end
    it 'contain proper value' do
      node = Node.new(2)
      expect(node.value).to eq(2)
    end
  end

  describe '#tree_constructors' do
    it 'should be defined without argument' do
      expect { LinkedList.new }.not_to raise_error
    end

    it 'should be defined with argument' do
      expect { LinkedList.new(5) }.not_to raise_error
    end

    it 'contains proper values' do
      list = LinkedList.new(5)
      expect(list.in_list?(5)).to be true
    end

    it 'returns proper size' do
      list = LinkedList.new(5)
      expect(list.size).to eq(1)
    end
  end

  describe '#add' do
    let(:list) { LinkedList.new(5) }
    it 'add should be defined' do
      expect { list.add(4) }.not_to raise_error
    end
    it 'should contain corect value' do
      list.add(4)
      expect(list.in_list?(4)).to be true
    end
    it 'should add node' do
      expect { list.add(Node.new(4)) }.not_to raise_error
    end
  end
  describe '#insert_at' do
    let(:list) { LinkedList.new(5) }
    it 'should be defined' do
      expect { list.insert_at(2, 1) }.not_to raise_error
    end
    it 'adds proper value at proper place' do
      list.add(3)
      list.add(10)
      list.insert_at(30, 2)
      expect(list.in_list?(30)).to be true
      expect(list.getnode_at(2).value).to eq(30)
    end
  end
  describe '#push_front' do
    let(:list) { LinkedList.new(5) }
    it 'push_front should be defined' do
      expect { list.push_front(2) }.not_to raise_error
    end
    it 'should contain new value on the beginning' do
      list.push_front(2)
      expect(list.pop_front).to eq(2)
    end
  end

  before(:each) do
    @list = LinkedList.new(3)
    @list.add(4)
    @list.add(10)
    @list.add(15)
    @list.add(6)
  end

  describe '#erase' do
    it 'erase(v) should be defined' do
      expect { @list.erase(3) }.not_to raise_error
    end
    it 'deletes proper node' do
      @list.erase(2)
      expect(@list.in_list?(10)).to be false
    end
  end
  describe '#pop_front' do
    it 'pop_front should be defined' do
      expect { @list.pop_front }.not_to raise_error
    end
    it 'delete from front' do
      @list.pop_front
      expect(@list.in_list?(3)).to be false
    end
  end
  describe '#remove_value' do
    it 'pop_back should be defined' do
      expect { @list.pop_back }.not_to raise_error
    end
    it 'delete from end' do
      @list.pop_back
      expect(@list.in_list?(6)).to be false
    end
  end
  describe '#erase' do
    it 'remove_value should be defined' do
      expect { @list.remove_value(2) }.not_to raise_error
    end
    it 'deletes proper value' do
      @list.remove_value(15)
      expect(@list.in_list?(15)).to be false
    end
  end

  describe '#getnode_at' do
    it 'getnode_at should be defined' do
      expect { @list.getnode_at(3) }.not_to raise_error
    end
    it 'should return proper element' do
      expect(@list.getnode_at(2).value).to eq(10)
    end
  end
  describe '#front' do
    it 'front should be defined' do
      expect { @list.front }.not_to raise_error
    end
    it 'should return first element' do
      expect(@list.front.value).to eq(3)
    end
  end
  describe '#getlast' do
    it 'getlast should be defined' do
      expect { @list.getlast }.not_to raise_error
    end
    it 'should return last element' do
      expect(@list.getlast.value).to eq(6)
    end
  end
  describe '#value_n_from_end' do
    it 'value_n_from_end should be defined' do
      expect { @list.value_n_from_end(2) }.not_to raise_error
    end
    it 'should return 2nd element from end' do
      expect(@list.value_n_from_end(2)).to eq(15)
    end
  end

  describe '#size' do
    let(:list) { LinkedList.new(3) }
    it 'should be defined' do
      expect { list.size }.not_to raise_error
    end
    it 'return proper size after adding' do
      expect { list.add(23) }.to change { list.size }.by(1)
    end
    it 'return proper size after deleting' do
      expect { list.pop_front }.to change { list.size }.by(-1)
    end
  end

  describe '#reverse_list' do
    before(:each) do
      @list = LinkedList.new(3)
      @list.add(5)
      @list.add(10)
    end
    it 'should be defined' do
      expect { @list.reverse_list }.not_to raise_error
    end
    it 'reverse list' do
      @list.reverse_list
      expect(@list.front.value).to eq(10)
      expect(@list.getnode_at(1).value).to eq(5)
      expect(@list.getlast.value).to eq(3)
    end
  end
end
