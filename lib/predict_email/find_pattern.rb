require 'csv'

module PredictEmail
  class FindPattern
    attr_reader :emails

    def initialize 
      @emails = CSV.read(Dir.pwd + '/lib/predict_email/csv/sample_data.csv').inject({}) do |result, element|
        result[element.first] = element.last
        result
      end 
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
  end 
end 


if $0 == __FILE__
  test = PredictEmail::FindPattern.new
end 