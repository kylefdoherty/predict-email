require 'pry'

class PredictEmail
  attr_reader :emails

  def initialize 
    @emails = {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com",
      "Kyle Doherty" => "kyle_doherty@flatironschool.com"
    }
  end 

  def normalize_company_name(company)
    company.downcase.gsub(/\s+/, "")
  end 

  def find_contacts(company)
    company = normalize_company_name(company)
    emails.select {|k,v| v.include?(company) }
  end 

  def split_email(email)
    email[/[^@]+/].downcase.split('.')
  end

  def email_pattern(contact)
    first_name, last_name = contact.first.downcase.split(' ')
    before_dot, after_dot = split_email(contact.last)

      if first_name == before_dot && last_name == after_dot
        "first_name_dot_last_name"
      elsif first_name == before_dot && last_name[0] == after_dot
        "first_name_dot_last_initial"
      elsif first_name[0] == before_dot && last_name == after_dot
        "first_initial_dot_last_name"
      elsif first_name[0] == before_dot && last_name[0] == after_dot
        "first_initial_dot_last_initial"
      else 
        nil
      end 
  end 

  def find_patterns(company)
    patterns = []

    if find_contacts(company).empty? 
      patterns << nil
    else 
 
      find_contacts(company).each do |contact|
        patterns << email_pattern(contact)
      end 

    end 
      patterns = patterns.uniq
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

  def predict_email(name, company)
    #find the pattern they use 
    #going to need to figure out how to deal with when it can't return a prediction
    patterns = find_patterns(company)
    return "Sorry, we can't predict the email for this person." unless patterns.first
    patterns_string = patterns_to_string(patterns)
    num_of_patterns = patterns.size
    pluralize_pattern = patterns.size > 1 ? 'patterns' : 'pattern'

    

    emails = patterns.map {|pat| self.send(pat.to_sym, name, company)}
    emails_string = emails_to_string(emails)

    #now I know which pattern(s) it uses
    #I want to be able to say it uses x pattern, give me back the correct email
    #for this pattern

    "#{company} uses #{num_of_patterns} email #{pluralize_pattern}: #{patterns_string}. We predict #{name}'s email to be: #{emails_string}."
    #use that to create email for person 
  end 

end 










