def word_machine(n)
  operations = n.split(" ")
  stack = []
  operations.each do |op|
    case op
    when /\A\d+\z/
      stack << op.to_i
    when "POP"
      stack.pop
    when "DUP"
      return -1 if stack.empty?
      stack << stack.last
    when "+"
      return -1 if stack.uniq.length < 2
      result = stack.pop + stack.pop
      return -1 if result < 0
      stack << result
    when "-"
      return -1 if stack.length < 2
      result = stack.pop - stack.pop
      return -1 if result < 0
      stack << result
    else
      puts "Invalid Operation"
    end
    break if stack.empty?
  end

  return -1 if stack.empty?
  stack.last
end

p word_machine "4 5 6 - 7 +"
p word_machine "13 DUP 4 POP 5 DUP + DUP + -"
p word_machine "5 6 + -"
p word_machine "3 DUP 5 - -"
p word_machine "1048575 DUP + Hello"
