require 'pry'
require_relative 'predict_email'

prediction = PredictEmail.new

p "Enter a name and company website, such as: 'Steve Jobs', 'Apple.com' OR type 'exit' to leave."
user_input = gets.strip

until user_input == 'exit'


  puts "\n"
  name, company = user_input.split(',')
  p prediction.predict_email(name, company.strip)
  puts "\n"
  p "Enter a name and company website, such as: 'Steve Jobs', 'Apple.com'"
  user_input = gets.strip

end 

