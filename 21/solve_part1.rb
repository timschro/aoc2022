input = File.read("input.txt").chomp.split("\n")

monkeys = {}
input.each do |line|
  monkey, operation = line.split(": ")
  param1, operator, param2 = operation.split(" ")
  if operator.nil?
    monkeys[monkey] = param1.to_i
  else
    monkeys[monkey] = [param1, operator, param2]
  end
end

def operate(args, monkeys)
  case args[1]
  when "+"
    monkeys[args[0]] + monkeys[args[2]]
  when "-"
    monkeys[args[0]] - monkeys[args[2]]
  when "*"
    monkeys[args[0]] * monkeys[args[2]]
  when "/"
    monkeys[args[0]] / monkeys[args[2]]
  end
end

while !monkeys["root"].is_a?(Integer)
  monkeys.each do |monkey|
    next if monkey[1].is_a?(Integer)
    monkeys[monkey[0]] = operate(monkey[1], monkeys) if monkeys[monkey[1][0]].is_a?(Integer) && monkeys[monkey[1][2]].is_a?(Integer)
 end
end

p monkeys["root"]