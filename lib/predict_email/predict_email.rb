require_relative 'find_pattern'

module PredictEmail
  class PredictEmail
    attr_reader :name, :company

    def initialize(name, company)
      @name = name
      @company = company 
    end 


    def predict_email
      patterns = FindPattern.new(company).find_patterns
      
      if patterns.first 
        emails = patterns.map {|pat| PatternMatcher.new(name, pat, company).return_match}
        "#{company} uses #{patterns.size} email #{pluralize_pattern(patterns)}: #{patterns_to_string(patterns)}. We predict #{name}'s email to be: #{emails_to_string(emails)}."
      else 
        "Sorry, we can't predict the email for this person."
      end 
    end 

    def patterns_to_string(patterns)
      patterns.join(", ")
    end 

    def emails_to_string(emails)
      emails.join(", ").gsub(", ", " OR ")
    end 

    def split_name(name)
      name.downcase.split(" ")
    end 


    def pluralize_pattern(patterns)
      patterns.size > 1 ? 'patterns' : 'pattern'
    end 

  end 
end 

 

  







