# Part 1
input = File.readlines('data04.txt')
bingo_numbers = input.shift.split(',').map(&:to_i)

boards = []
while input.length >= 6
  board = []
  input.shift
  5.times { board << input.shift.split.map { |v| [v.to_i, false] } }
  boards << [board, false]
end

def bingo?(b, i, j)
  vertical?(b, i, j) || horizontal?(b, i, j)
end

def vertical?(b, i, j)
  b[i][0][1] && b[i][1][1] && b[i][2][1] && b[i][3][1] && b[i][4][1]
end

def horizontal?(b, i, j)
  b[0][j][1] && b[1][j][1] && b[2][j][1] && b[3][j][1] && b[4][j][1]
end

def mark!(b, val)
  b.each_with_index do |row, i|
    row.each_with_index do |tuple, j|
      if val == tuple[0]
        tuple[1] = true
        return [i, j]
      end
    end
  end
  nil
end

def score(b, final_number)
  b.flatten(1).reject(&:last).sum(&:first) * final_number
end

def find_winning_score!(bingo_numbers, boards)
  bingo_numbers.each do |number|
    boards.each_with_index do |(b, won), i|
      next if won
      x, y = mark!(b, number)
      if x && bingo?(b, x, y)
        boards[i][1] = true
        return score(b, number)
      end
    end
  end
  raise "No bingo!"
end

puts find_winning_score!(bingo_numbers, boards)

# Part 2

(boards.length - 2).times { find_winning_score!(bingo_numbers, boards) }
puts find_winning_score!(bingo_numbers, boards)
