signal = File.read("input.txt")
SIZES = [4, 14]

SIZES.each do |size|
  marker = []
  signal.split("").each_with_index do |char,pos|
    marker << char
    marker.shift if marker.size > size
    if marker.size == size && marker.size == marker.uniq.size
      puts "Block size #{size}: Pos #{pos + 1}" 
      break
    end
  end
end