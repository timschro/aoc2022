count = 0

File.read("input.txt").split("\n").each do |line| 
   assignments = line.split(",")
   a0 = assignments[0].split("-").map(&:to_i)
   a1 = assignments[1].split("-").map(&:to_i)
    
   count += 1 if (a0.first..a0.last).to_a.intersection((a1.first..a1.last).to_a).length > 0
end

p count
