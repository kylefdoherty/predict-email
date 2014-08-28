require 'pry'
require_relative 'find_pattern'

class PredictEmail

  def predict_email(name, company)
    patterns = FindPattern.new.find_patterns(company)
    if patterns.first 
      emails = patterns.map {|pat| self.send(pat.to_sym, name, company)}
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

  def first_name_dot_last_name(name, company)
    first, last = split_name(name)
    "#{first}.#{last}@#{company}"
  end 

  def first_name_dot_last_initial(name, company)
    first, last = split_name(name)
    "#{first}.#{last[0]}@#{company}"
  end 

  def first_initial_dot_last_name(name, company)
    first, last = split_name(name)
    "#{first[0]}.#{last}@#{company}"
  end 

  def first_initial_dot_last_initial(name,company)
    first, last = split_name(name)
    "#{first[0]}.#{last[0]}@#{company}"
  end 

  def pluralize_pattern(patterns)
    patterns.size > 1 ? 'patterns' : 'pattern'
  end 

end 


 

  







