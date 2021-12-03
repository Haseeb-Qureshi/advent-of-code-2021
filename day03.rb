# Part 1

INPUT = File.readlines('data03.txt')
data = INPUT.map(&:chomp)

len = data[0].length
counts = [0] * len
data.each do |num|
  num.each_char.with_index { |c, i| counts[i] += 1 if c == '1' }
end

def unbinary(s)
  s.length.times.reduce(0) do |n, i|
    n + s[-i - 1].to_i * 2 ** i
  end
end

most_common = counts.map { |cnt| cnt >= data.length / 2 ? 1 : 0 }
least_common = most_common.map { |bit| bit == 0 ? 1 : 0 }
puts unbinary(most_common) * unbinary(least_common)


# Part 2

def scrub_by(data, more)
  remaining = data.sort
  tiebreaker = more ? '1' : '0'

  data[0].length.times do |i|
    ones = remaining.count { |d| d[i] == '1' }
    zeroes = remaining.count - ones
    if ones == zeroes
      choose = tiebreaker
    else
      if more
        choose = ones > zeroes ? '1' : '0'
      else
        choose = ones > zeroes ? '0' : '1'
      end
    end

    remaining.select! { |d| d[i] == choose }
    return unbinary(remaining[0]) if remaining.length == 1
  end
  raise "no luck"
end


puts scrub_by(data, true) * scrub_by(data, false)
