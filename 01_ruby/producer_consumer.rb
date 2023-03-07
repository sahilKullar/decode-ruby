require 'thread'
buffer = SizedQueue.new(2)
producer = Thread.new do
  item = 0
  loop do
    sleep(rand * 0.1)
    puts "Producer makes #{item}"
    buffer.enq item
    item += 1
  end
end

consumer = Thread.new do
  loop do
    sleep((rand 0.1) + 0.09)
    item = buffer.deq
    puts "Consumer retrieves #{item}"
    puts "waiting = #{buffer.num_waiting}"
  end
end

p producer
p consumer

buff = Queue.new
buff.enq "one"
buff.enq "two"
buff.enq "three"
n1 = buff.size # 3
p n1
flag1 = buff.empty? # false
p flag1
buff.clear
n2 = buff.size # 0
p n2
flag2 = buff.empty? # true
p flag2
