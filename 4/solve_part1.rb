count = 0

File.read("input.txt").split("\n").each do |line| 
   assignments = line.split(",")
   a0 = assignments[0].split("-").map(&:to_i)
   a1 = assignments[1].split("-").map(&:to_i)
   count += 1  if (a0.first >= a1.first && a0.last <= a1.last) || (a1.first >= a0.first && a1.last <= a0.last)

end

p count
