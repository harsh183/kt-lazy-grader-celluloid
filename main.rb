require 'celluloid'
require 'pry'

# We setup an actor for every question
class Question
  include Celluloid
  attr_accessor :question_number,
                :title, 
                :starter_code, 
                :test_code, 
                :points, 
                :attempts
  def initialize(question_number, title, starter_code)
    @question_number = question_number
    @title = title
    @starter_code = starter_code 
    @test_code = File.read("p#{question_number}_tests.kt")
    @points = 0
    @attempts = 0
  end

  def submit(student_code)
    @attempts += 1
    future.grade(student_code)
  end

  def grade(student_code)
    framework = File.read("framework.kt")
    payload = framework + @test_code + student_code 
    
    sleep 10 # some long ish time

    return 100.0
  end
end

puts "Welcome to proof of concept kt homework program"

# puts "Enter your username"
# username = gets.chomp

questions = [ Question.new(0, "Add two numbers", "fun add(x: Int, y: Int) = "),
              Question.new(1, "Multiply everything in a list", "fun multiply(in: List<Int>) = ") ]
puts "Pick which question you want to do"
questions.each {|item| puts "#{item.question_number}: #{item.title}"}
question_number = gets.chomp.to_i

question = questions[question_number]
file_name = "input.kt"
File.write(file_name, question.starter_code) # unhardcode

vim_status = system "vim #{file_name}" # check on status
student_code = File.read(file_name) 
File.delete(file_name) # delete temp file

futures = []

# to simulate some load
rand(3..10).times {
    futures << question.submit(student_code)
    sleep rand(1..3)
}

binding.pry
