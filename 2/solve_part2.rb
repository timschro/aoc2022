
sum = 0
commands = %w[A B C]

win = {A: "C", B: "A", C: "B"}
loose = {A: "B", B: "C", C: "A"}

File.read("input.txt").split("\n").each do |line| 
    opp,res = line.split(" ")

    case res
    when "X"
        #opp wins
        me = win[opp.to_sym]
        sum += 0
    when "Y"
        #draw
        me = opp
        sum += 3
    when "Z"
        #opp looses
        me = loose[opp.to_sym]
        sum += 6
    end

    sum += commands.index(me) + 1

end

p sum
