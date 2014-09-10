require 'csv'

module PredictEmail
  class FindPattern
    attr_reader :emails, :company_name

    def initialize(company_name, emails = nil) 
      @emails = emails || {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com",
      "Kyle Doherty" => "kyle_doherty@flatironschool.com"
    }

      @company_name = company_name
    end 

    
    def find_patterns
      find_contacts.map do |contact|
        email_pattern(contact)
      end.compact.uniq
    end 

    private 
    def find_contacts
      emails.select {|k,v| v.include?(company_name.downcase.gsub(/\s+/, "")) }
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
          
        end 
    end 

  end 
end 


if $0 == __FILE__
  test = PredictEmail::FindPattern.new
end 