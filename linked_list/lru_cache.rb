require_relative 'doubly_linked_list'

class LruCache
  attr_accessor :cache, :current_size, :list_of_most_recent, :max_size

  def initialize(max_size)
    self.cache = {}
    self.current_size = 0
    self.list_of_most_recent = DoublyLinkedList.new
    self.max_size = max_size || 0
  end

  def insert_key_value_pair(key, value)
    if self.cache.key? key
      self.replace_key(key, value)
    else
      if self.current_size == self.max_size
        self.evict_least_recent
      else
        self.current_size += 1
      end
      self.cache[key] = DoublyLinkedListNode.new(key, value)
    end
    self.update_most_recent(self.cache[key])
  end

  def evict_least_recent
    node_to_remove = self.list_of_most_recent.tail.key
    self.list_of_most_recent.remove_tail
    self.cache.delete(node_to_remove)
  end

  def replace_key(key, value)
    if self.cache.key? key
      self.cache[key].value = value
    else
      raise Exception, "The provided key isn't in the cache!"
    end
  end

  def update_most_recent(node)
    self.list_of_most_recent.set_head(node)
  end

  def get_value_from_key(key)
    if self.cache.key? key
      self.update_most_recent(self.cache[key])
      self.cache[key].value
    else
      nil
    end
  end

  def get_most_recent_key
    self.list_of_most_recent.head.key
  end
end

class DoublyLinkedListNode
  attr_accessor :key, :value, :next, :prev

  def initialize(key, value)
    self.key = key
    self.value = value
    self.next = nil
    self.prev = nil
  end
end

lru_cache = LruCache.new(3)
lru_cache.insert_key_value_pair("b", 2)
lru_cache.insert_key_value_pair("a", 1)
lru_cache.insert_key_value_pair("c", 3)
# chai.expect(lru_cache.getMostRecentKey()).to.deep.equal('c') 
p lru_cache.get_most_recent_key
# chai.expect(lru_cache.getValueFromKey('a')).to.deep.equal(1)
p lru_cache.get_value_from_key("a")
# chai.expect(lru_cache.getMostRecentKey()).to.deep.equal("a")
p lru_cache.get_most_recent_key
lru_cache.insert_key_value_pair("d", 4)
# chai.expect(lru_cache.getValueFromKey("b")).to.deep.equal(null)
p lru_cache.get_value_from_key("b")
lru_cache.insert_key_value_pair("a", 5)
# chai.expect(lru_cache.getValueFromKey("a")).to.deep.equal(5)
p lru_cache.get_value_from_key("a")