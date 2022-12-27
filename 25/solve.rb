include Math

input = File.read("input.txt").chomp.split("\n")


def snafu2dec(snafu)
  snafu = snafu.split("").reverse
  sum = 0
  snafu.each_with_index do |no, i|
    power = 5.pow(i)
    no = -1 if no=="-"
    no = -2 if no=="="
    sum += no.to_i * power
  end
  sum
end

def dec2snafu(dec)  
  snafu = ""
  while dec > 0 
    dec, r = dec.divmod(5)
    if r <= 2
      snafu += r.to_s
    end
    if r == 4
      snafu += "-" 
      dec += 1
    end
    if r == 3
      snafu += "=" 
      dec += 1
    end
  end
  snafu.reverse
end


total = 0
input.each do |line|
  total += snafu2dec(line)
end

puts "total: #{total}"
puts "snafu: #{dec2snafu(total)}"

