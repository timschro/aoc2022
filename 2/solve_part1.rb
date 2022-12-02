
sum = 0

opp_commands = %w[A B C]
my_commands = %w[X Y Z]

File.read("input.txt").split("\n").each do |line| 
    opp,me = line.split(" ")

    case me
    when "X"
        sum += 1
    when "Y"
        sum += 2
    when "Z"
        sum += 3
    end

    me = opp_commands[my_commands.index(me)]

    if opp == me
        sum += 3
    elsif opp == "A" && me == "B" || opp == "B" && me == "C" || opp == "C" && me == "A"
        sum += 6
    end

end

p sum
