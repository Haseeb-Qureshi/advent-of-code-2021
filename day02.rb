# Part 1
INPUT = File.readlines('data02.txt')
data = INPUT.map { |l| l.split }

x, y = 0, 0
data.each do |dir, n|
  case dir
  when 'forward' then x += n.to_i
  when 'down' then y += n.to_i
  when 'up' then y -= n.to_i
  else raise "wtf is #{dir}"
  end
end

puts x * y

# Part 2

x, y, aim = 0, 0, 0
data.each do |dir, n|
  case dir
  when 'forward' then x += n.to_i and y += n.to_i * aim
  when 'down' then aim += n.to_i
  when 'up' then aim -= n.to_i
  else raise "wtf is #{dir}"
  end
end

puts x * y
