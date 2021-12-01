# Part 1
INPUT = File.readlines('data01.txt')
data = INPUT.map(&:to_i)
puts data.each_cons(2).count { |a, b| a < b }

# Part 2
puts data.each_cons(4).count { |a, _, _, d| a < d }
