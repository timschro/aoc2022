commands = File.read("input.txt").split("\n")

visited = []

def move_head(start, direction)
  target = start
  case direction
  when "R"  
    target = [target[0] + 1, target[1]]
  when "U"
    target = [target[0], target[1] + 1]
  when "L"
    target = [target[0] - 1, target[1]]
  when "D"
    target = [target[0], target[1] - 1]
  end
  target
end

def move_tail(start, position_head)
  dist_x = position_head[0] - start[0] 
  dist_y = position_head[1] - start[1]

  if (dist_x.abs < 2 && dist_y.abs < 2) || ((start[0] == position_head[0] && dist_y.abs < 2 ) || (start[1] == position_head[1] && dist_x.abs < 2))
    target = start
  elsif start[0] == position_head[0] || start[1] == position_head[1]
    prefix_x = dist_x > 0 ? 1 : -1
    prefix_y = dist_y > 0 ? 1 : -1
    if dist_x.abs > 0
      target = [start[0] + prefix_x, start[1]]
    else 
      target = [start[0], start[1] + prefix_y]
    end
  else
    prefix_x = dist_x > 0 ? 1 : -1
    prefix_y = dist_y > 0 ? 1 : -1
    target = [start[0] + prefix_x, start[1] + prefix_y]
  end
  target
end

current_head = [0,0]
current_tails = Array.new(9, [0,0])


commands.each do |command|
  direction,distance = command.split(" ")
  distance = distance.to_i

  puts command
  distance.times do |i|
    current_head = move_head(current_head, direction)
    predecessor = current_head
    current_tails.each_with_index do |current_tail, i|
      current_tails[i] = move_tail(current_tail, predecessor)
      predecessor = current_tails[i]
      visited << current_tails[i] if i == current_tails.size - 1
    end
  end
end

puts "=================="
p visited.uniq.size