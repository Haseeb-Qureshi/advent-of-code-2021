# Part 1
INPUT = File.read('data07.txt').chomp
crabs = INPUT.split(',').map(&:to_i)

def dist_to(crabs, x)
  crabs.sum { |n| (n - x).abs }
end

min = 0.upto(crabs.max).min_by { |x| dist_to(crabs, x) }
puts dist_to(crabs, min)

# Part 2

MEMO = Hash.new { |h, k| h[k] = h[k - 1] + k }
MEMO[0] = 0

def expensive_dist_to(crabs, x)
  crabs.sum { |n| MEMO[(n - x).abs] }
end

min = 0.upto(crabs.max).min_by { |x| expensive_dist_to(crabs, x) }
puts expensive_dist_to(crabs, min)
