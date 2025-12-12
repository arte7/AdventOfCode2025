# frozen_string_literal: true
require 'pry'
require 'benchmark'

puts Benchmark.measure {
file_path = 'input/day2.txt'
file = File.open(file_path, 'r')
input = <<~INPUT
  11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
  1698522-1698528,446443-446449,38593856-38593862,565653-565659,
  824824821-824824827,2121212118-2121212124
INPUT

results = []

file.each_line do |line|
  line.chomp!
  line.split(',') do |digits|
    first, last = digits.split('-')
    fs = first.size
    ls = last.size
    next if fs.odd? && fs == ls

    range = Range.new(first.to_i, last.to_i)
    range.each do |i|
      s = i.to_s
      next if s.size.odd?

      half = s.size/2
      results << i if s[...half] == s[half..]
    end
  end
end
puts "sum of all numbers: #{results.sum}"
file.close
}
