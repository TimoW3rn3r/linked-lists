class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    cursor = @head
    while cursor
      return cursor if cursor.next_node.nil?

      cursor = cursor.next_node
    end
  end

  def append(value)
    unless @head
      @head = Node.new(value)
      return @head
    end
    tail.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
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
    while cursor
      if cursor.next_node == tail
        cursor.next_node = nil
        return tail
      end
      cursor = cursor.next_node
    end
    @head = nil
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

    "#{list} nil"
  end

  def insert_at(value, index)
    return @head = Node.new(value, @head) if index.zero?

    cursor = @head
    current_index = 0
    while cursor
      return cursor.next_node = Node.new(value, cursor.next_node) if current_index + 1 == index

      cursor = cursor.next_node
      current_index += 1
    end
    nil
  end

  def remove_at(index)
    if index.zero?
      to_remove = @head
      @head = @head.next_node
      return to_remove
    end

    cursor = @head
    current_index = 0
    while cursor
      if current_index + 1 == index
        return nil if cursor == tail

        to_remove = cursor.next_node
        cursor.next_node = to_remove.next_node
        return to_remove
      end
      cursor = cursor.next_node
    end
    nil
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
