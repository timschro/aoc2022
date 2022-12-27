pairs = File.read("input.txt").chomp.split("\n\n")

ordered_pairs = []

dividers = [[[2]], [[6]]]

def compare(a, b)  
  if a.is_a?(Integer) && b.is_a?(Integer)
    a <=> b
  elsif a.is_a?(Array) && b.is_a?(Array)
    (0..([a.size, b.size].min - 1)).each do |i|
      cmp = compare(a[i], b[i])
      return cmp if cmp != 0
    end
    a.size <=> b.size
  else
    if a.is_a?(Integer)
      compare([a], b)
    else
      compare(a, [b])
    end
  end
end

pairs.each_with_index do |pair, index|
  a,b = pair.split("\n").map { |tmp| eval(tmp)}
  cmp = compare(a, b)
  ordered_pairs << index + 1 if cmp == -1
end

p ordered_pairs.sum


packets = pairs.map { |pair| pair.split("\n").map { |tmp| eval(tmp)} }.flatten(1)
dividers.each { |divider| packets << divider }

packets.sort! {|a, b| compare(a,b)}

divider_indices = []
dividers.each { |divider| divider_indices << packets.index(divider) + 1}

p divider_indices.inject(&:*)
