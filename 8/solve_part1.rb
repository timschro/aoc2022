trees = File.read("input.txt").split("\n").map { |s| s.split("").map(&:to_i) }

visible_trees = []

def check(from, to, cell, trees, row, col)
  raise "row and col cannot both be set or nil" if (row == nil && col == nil) || (row != nil && col != nil)
  visible = true

  (from..to).each do |i|
    visible = false if col != nil && (trees[i][col] >= cell)
    visible = false if row != nil && (trees[row][i] >= cell)
  end
  visible
end

trees.each_with_index do |row, row_index|
  row.each_with_index do |col, col_index|
    visible = false

    if col_index == 0 || col_index == row.size - 1 || row_index == 0 || row_index == trees.size - 1
      visible = true
    else
      visible = check(0, row_index - 1, col, trees, nil, col_index) || check(row_index + 1, trees.size - 1, col, trees, nil, col_index) || check(0, col_index - 1, col, trees, row_index, nil) || check(col_index + 1, row.size - 1, col, trees, row_index, nil)
    end

    visible_trees << [row_index, col_index] if visible
  end
end

p visible_trees.uniq.size
