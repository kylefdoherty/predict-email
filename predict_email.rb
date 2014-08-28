require 'pry'

class PredictEmail
  attr_reader :patterns, :emails

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


  #take company and get back emails from that company that we have (most likely would be from database)
  #use those emails to to find pattern company uses
  #return that pattern

  def normalize_company_name(company)
    company.downcase.gsub(/\s+/, "")
  end 

  def find_contacts(company)
    company = normalize_company_name(company)
    company_contacts = emails.select {|k,v| v.include?(company) }
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
        "Sorry, can not predict pattern for this company."
      end 

  end 

  def find_patterns(company)
    patterns = []
 
    find_contacts(company).each do |contact|
      patterns << email_pattern(contact)
    end 

    patterns = patterns.uniq
  end 








end 