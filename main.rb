require 'celluloid'

puts "Welcome to proof of concept kt homework program"

# puts "Enter your username"
# username = gets.chomp

questions = ["Add two numbers", "Multiply everything in a list"] # starter code, file_name
puts "Pick which question you want to do"
questions.each_with_index {|item, index| puts "#{index} #{item}" }
question_number = gets.chomp.to_i

question = questions[question_number]
file_name = "input.kt"
File.write(file_name, "fun add(x: Int, y:Int) {}") # unhardcode

vim_status = system "vim #{file_name}" # check on status
student_code = File.read(file_name) 
File.delete(file_name) # delete temp file

framework = File.read("framework.kt")
tests = File.read("p#{question_number}_tests.kt")

payload = framework + tests + student_code

puts payload

class ProblemAttempt
  include Celluloid
  attr_accessor :payload, :points, :response, :attempt

  def grade
    return 100.0
  end
end
