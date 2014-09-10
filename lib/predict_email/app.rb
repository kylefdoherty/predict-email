require_relative 'predict_email'

module PredictEmail
  module Cli
    class App 


      def parse_input(user_input)
        user_input.split(',')
      end 

      def valid_input(user_input)
        name, company = parse_input(user_input)
        if name.split(" ").size != 2 || company == nil
          p "Please enter a first and last name along with the company, such as: 'Steve Jobs', 'Apple.com'"
          user_input = gets.strip
          valid_input(user_input) 
        else
          return user_input    
        end 
      end 

      def initialize
    
        puts "Enter a name and company website, such as: 'Steve Jobs', 'Apple.com' OR type 'exit' to leave."
        user_input = gets.strip
        
        until user_input == 'exit'

          puts "\n"
          name, company = parse_input(valid_input(user_input))
          p "PREDICTION: #{PredictEmail.new(name, company.strip).predict_email}"
          puts "\n"
          p "Enter a name and company website, such as: 'Steve Jobs', 'Apple.com'"
          user_input = gets.strip

        end 
      end




    end 
  end 
end 

if $0 == __FILE__
  PredictEmail::Cli::App.new
end 








