class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    unless @head
      @head = Node.new(value)
      @tail = @head
      return @head
    end
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @tail ||= @head
  end

  def size
    current = @head
    counter = 0
    while current
      counter += 1
      current = current.next_node
    end
    counter
  end

  def at(index)
    cursor = @head
    current_index = 0
    while cursor
      return cursor if current_index == index

      cursor = cursor.next_node
      current_index += 1
    end
    nil
  end

  def pop
    cursor = @head

    if cursor.next_node
      while cursor
        if cursor.next_node == @tail
          popped = @tail
          cursor.next_node = nil
          @tail = cursor
          break
        end
        cursor = cursor.next_node
      end
    else
      popped = @head
      @head = nil
      @tail = nil
    end
    popped
  end

  def contains?(value)
    cursor = @head
    while cursor
      return true if cursor.value == value

      cursor = cursor.next_node
    end
    false
  end

  def find(value)
    cursor = @head
    index = 0
    while cursor
      return index if cursor.value == value

      cursor = cursor.next_node
      index += 1
    end
    nil
  end

  def to_s
    list = ''
    cursor = @head

    while cursor
      list += "( #{cursor.value} ) -> "
      cursor = cursor.next_node
    end

    list += 'nil'
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
