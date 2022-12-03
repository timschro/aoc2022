badges = []
common_items = []

File.readlines("input.txt").each_with_index do |line,i|
    items = line.strip.split("").uniq

    case i % 3
    when 0    
        common_items = items
    when 1
        common_items = common_items.intersection(items)
    when 2
        common_items = common_items.intersection(items)
        badges << common_items
    end
end

sum = 0
badges.flatten!.each do |item|
    sum += item.ord  - 38 if item.ord < 91
    sum += item.ord  - 96 if item.ord > 96
end

p sum