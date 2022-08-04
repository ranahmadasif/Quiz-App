require 'timeout'
require "csv"

file = CSV.parse(File.read("problems.csv"))

def Q(q, ans, timer)
    puts "\nQUESTIONS\n"
    puts q
    Timeout::timeout(timer) do
      ansUser = gets.chomp
      return ansUser === ans
    end
  rescue Timeout::Error
    return false
  end
  

timer = 3
score = 0

for arr in 0..file.length-1 do
    correct = Q(file[arr][0], file[arr][1], timer)
    score += 1 if correct
end

puts "No. of questions: #{file.length}"
puts "Correct answers: #{score}"

