trees = File.read("input.txt").split("\n").map { |s| s.split("").map(&:to_i) }

scenic_trees = []

def check(from, to, tree, trees, row, col)
  raise "row and col cannot both be set or nil" if (row == nil && col == nil) || (row != nil && col != nil)

  range = (to..from).to_a.reverse if from > to
  range = (from..to).to_a if from <= to
  dist = nil

  range.each do |i|
    check_tree = trees[i][col] if !col.nil?
    check_tree = trees[row][i] if !row.nil?
    if check_tree >= tree && i != from
      dist = [from, i].max - [from, i].min
      break
    end
  end
  dist = [from, to].max - [from, to].min if dist.nil?
  p dist
  dist
end

trees.each_with_index do |row, row_index|
  row.each_with_index do |col, col_index|
    distances = []
    distances << check(row_index, 0, col, trees, nil, col_index) # up
    distances << check(row_index, trees.size - 1, col, trees, nil, col_index) # down
    distances << check(col_index, 0, col, trees, row_index, nil) #left
    distances << check(col_index, row.size - 1, col, trees, row_index, nil) #right
    scenic_trees << distances.inject(:*)
  end
end

p scenic_trees.max
