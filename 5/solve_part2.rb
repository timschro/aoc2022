count = 0

stacks_input, commands = File.read("input.txt").split("\n\n")

stacks_input = stacks_input.split("\n")
commands = commands.split("\n")
number_of_stacks_input = stacks_input.pop.scan(/\d+/).map(&:to_i).max

stacks = Array.new(number_of_stacks_input) { [] }

stacks_input.each do |line|
   number_of_stacks_input.times do |i|
      stacks[i].push(line[i*4+1]) unless line[i*4+1] == " "
   end
end

commands.each do |command| 
   amount, source, target = command.scan(/\d+/).map(&:to_i)
   stacks[target-1].prepend(stacks[source-1].slice!(0,amount)) 
   stacks[target-1].flatten!
end

puts stacks.collect {|stack| stack.first}.join