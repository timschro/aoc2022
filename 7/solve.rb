commands = File.read("input.txt").split("\n").map(&:chomp)
dirs = {}
path = []
$filesystem = {}
files=[]

def calculate(dir)
   sum = 0
   $filesystem[dir].each do |file|
      if file.is_a? Integer
         sum += file
      else
         sum += calculate(file)
      end
   end
   sum
end

commands.each do |command| 
   if command.start_with? "$ "
      _, cmd, arg = command.split(" ")
      case cmd
      when "cd"
         path.pop if arg == ".."
         path << arg unless arg == ".."
         $filesystem[path.join("/")] = [] unless arg == ".."
      when "ls"
         files=[]
      end
   else
      $filesystem[path.join("/")] << command.split(" ").first.to_i unless command.start_with? "dir"
      $filesystem[path.join("/")] << path.join("/") + "/" + command.split(" ").last if command.start_with? "dir"
   end
end

free_space = 70000000 - calculate("/")
needed_space = 30000000
delta = needed_space - free_space

sum_p1 = 0
deletable = []

$filesystem.each do |dir, files|
   sum_dir = calculate(dir)
   if sum_dir <= 100000
      sum_p1 += sum_dir
   end
   deletable << sum_dir if sum_dir > delta
end

puts "--> Part 1: #{sum_p1}"
puts "--> Part 2: #{deletable.min}"
