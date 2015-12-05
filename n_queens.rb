def n_queens(n = 8, positions = [], count = 0, row = 0)
  if violation?(n, positions)
    return count
  elsif positions.length == n
    count += 1
    p positions
    return count
  else
    (0..n-1).to_a.each do |pos|
      new_queen_location = pos + row * n
      positions << new_queen_location
      count = n_queens(n, positions, count, row + 1)
      positions.pop
    end
  end
  count
end

def violation?(n, positions)
  x = []
  y = []
  forward_dia  = []
  backward_dia = []

  positions.each do |pos|
    x << pos % n
  end
  return true if x != x.uniq

  positions.each do |pos|
    y << pos / n
  end
  return true if y != y.uniq

  positions.each do |pos|
    forward_dia  << pos % n - pos / n
  end
  return true if forward_dia != forward_dia.uniq

  positions.each do |pos|
    backward_dia << pos % n + pos / n
  end
  return true if backward_dia != backward_dia.uniq

  false

  # algorithm speed increased by 15-20% after breaking these checks up into separate chunks
  # if x != x.uniq || y != y.uniq || forward_dia != forward_dia.uniq || backward_dia != backward_dia.uniq
  #   true
  # else
  #   false
  # end
  
end

# 4 => 2
# 5 => 10
# 6 => 4
# 7 => 40
# 8 => 92
# 9 => 352
# 10 => 724
# 11 => 2680
# 12 => 14200
# 13 => 73712