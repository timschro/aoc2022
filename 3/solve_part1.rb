double_items = []

File.readlines("input.txt").each do |line|
    items = line.strip.split("")
    c1,c2 = items.each_slice( (items.size/2.0).round ).to_a
    c1.uniq!
    c2.uniq!
    double_items << c1.intersection(c2)
end

sum = 0
double_items.flatten!.each do |item|
    sum += item.ord  - 38 if item.ord < 91
    sum += item.ord  - 96 if item.ord > 96
end

p sum