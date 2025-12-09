# frozen_string_literal: true

file_path = 'input/day1.txt'
# r is readmode
file = File.open(file_path, 'r')

input = <<~INPUT
  L68
  L30
  R48
  L5
  R60
  L55
  L1
  L99
  R14
  L82
INPUT

array = Array.new(100) { |i| i }
position = array[50]
counter = 0

file.each_line do |line|
  line.chop!
  dir, steps = line.split('', 2)
  steps = steps.to_i
  while steps > 99
    steps -= 100
  end
  if dir == "L"
    position = array[(position - steps)]
    puts array[position]
  elsif dir == "R"
    position += steps
    if position > 99
      position -= 100
    end
    puts array[position]
  end
  if array[position].zero?
    counter += 1
  end
end
puts "end counter #{counter}"

file.close
