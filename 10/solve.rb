commands = File.read("input.txt").split("\n")

probes = [20, 60, 100, 140, 180, 220]
running_commands = []
is_running = true
i=0
x=1
signal_strength = 0

while is_running
  i+=1
  signal_strength += i * x if probes.include?(i)
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

p signal_strength