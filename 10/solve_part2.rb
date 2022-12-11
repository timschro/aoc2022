commands = File.read("input.txt").split("\n")

probes = [20, 60, 100, 140, 180, 220]
running_commands = []
is_running = true
i = 0
px = 0
x = 1
crt = []
tmp = []

while is_running
  if px == 40
    px = 0
    crt << tmp
    tmp = []
  end
  if [x - 1, x, x + 1].include?(px)
    tmp << "#"
  else
    tmp << " "
  end
  i += 1
  px += 1
  if running_commands.size > 0
    command = running_commands.shift
    cmd, val = command.split(" ")
    val = val.to_i
    x += val
  else
    command = commands.shift
    next if command == "noop"
    running_commands << command unless command.nil?
  end
  is_running = false if commands.size == 0 && running_commands.size == 0
end

crt.each do |row|
  puts row.join("")
end
