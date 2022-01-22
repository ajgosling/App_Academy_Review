def is_prime?(n)
  return false if n < 2
  (2...n).each {|i| return false if n % i == 0}
  true
end

def nth_prime(n)
  primes_arr = []
  i = 2
  while primes_arr.length < n
    primes_arr << i if is_prime?(i)
    i += 1
  end
  primes_arr.last
end

def prime_range(min, max)
  primes_arr = []
  while min <= max
    primes_arr << min if is_prime?(min)
    min += 1
  end
  primes_arr
end