input = File.read("input_test.txt").chomp.split("\n")

Cube = Struct.new(:x, :y, :z) do
  def neighbors
    [
      Cube.new(x, y, z + 1),
      Cube.new(x, y, z - 1),
      Cube.new(x + 1, y, z),
      Cube.new(x - 1, y, z),
      Cube.new(x, y - 1, z),
      Cube.new(x , y + 1, z),
    ]
  end
  

end

cubes = []

input.each do |line|
  x,y,z = line.split(",").map(&:to_i)
  cubes << Cube.new(x,y,z)
end


free_sides = []
cubes.each do |cube|
  cube.neighbors.each do |neighbor|
    free_sides << cube unless cubes.include?(neighbor)
  end

end

puts "surface #{free_sides.count}"

exterior_surface = 0

edges = {
  x: cubes.map(&:x).minmax, 
  y: cubes.map(&:y).minmax, 
  z: cubes.map(&:z).minmax 
}
sides_encapsulated = []
(edges[:x][0]..edges[:x][1]).each do |x|
  (edges[:y][0]..edges[:y][1]).each do |y|
    (edges[:z][0]..edges[:z][1]).each do |z|
      cube = Cube.new(x,y,z)
      next if cubes.include?(cube)
      side_open = false
      cube.neighbors.each do |neighbor|
        if !cubes.include?(neighbor)
          side_open = true
        end
      end
      sides_encapsulated << cube.neighbors unless side_open
    end
  end
end


p (free_sides - sides_encapsulated.flatten).size

p sides_encapsulated.flatten.size

puts "exterior surface #{free_sides.size - sides_encapsulated.flatten.compact.size}"