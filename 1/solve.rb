elves = []

File.read("input.txt").split("\n\n").each { |e| elves << e.split("\n").map(&:to_i).sum }

p elves.max
p elves.max(3).sum
