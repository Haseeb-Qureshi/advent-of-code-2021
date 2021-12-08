# Part 1
INPUT = File.read('data06.txt').chomp
raw_fish_timers = INPUT.split(',').map(&:to_i)

timers = Array.new(9, 0)
raw_fish_timers.each { |timer| timers[timer] += 1 }

def simulate_step(timers)
  zeroes = timers[0]
  timers.each_index do |i|
    next if i == 0
    timers[i - 1] = timers[i]
  end
  timers[-1] = zeroes
  timers[6] += zeroes
end

80.times { simulate_step(timers) }
puts timers.sum

# Part 2

(256 - 80).times { simulate_step(timers) }
puts timers.sum
