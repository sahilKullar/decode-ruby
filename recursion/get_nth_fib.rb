# Time - O(n ^ 2)
# Space - O(n)
# where F0 = 0 and F1 = 1
def get_nth_fib(n)
  if n == 2
    return 1
  elsif n == 1
    return 0
  else
    return get_nth_fib(n - 1) + get_nth_fib(n - 2)
  end
end

# Time - O(n)
# Space - O(n)
def get_nth_fib_memoize(n, memoize = {1 => 0, 2 => 1})
  if memoize.include?(n)
    return memoize[n]
  else
    memoize[n] = get_nth_fib_memoize(n - 1, memoize) + get_nth_fib_memoize(n - 2, memoize)
    return memoize[n]
  end
end

def fibonacci(n)
  return n if n < 2

  fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci_memoize(n, memoize = []) # or memoize = {}
  return n if n < 2
  return memoize[n] if memoize[n]

  memoize[n] = fibonacci_memoize(n - 1, memoize) + fibonacci_memoize(n - 2, memoize)
end

p get_nth_fib(6)
p get_nth_fib_memoize(6)
p fibonacci(6)
p fibonacci_memoize(6)