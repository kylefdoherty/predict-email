class PredictEmail::PatternMatcher 
  def initialize(name, pattern, company)
    @first_name, @last_name = name.downcase.split(' ')
    @pattern = pattern
    @company = company 
  end 

  def return_match
    self.send(pattern)
  end 


  private
  attr_reader :first_name, :last_name, :pattern, :company 

  def first_name_dot_last_name
    "#{first_name}.#{last_name}@#{company}"
  end 

  def first_name_dot_last_initial
    "#{first_name}.#{last_name[0]}@#{company}"
  end 

  def first_initial_dot_last_name
    "#{first_name[0]}.#{last_name}@#{company}"
  end 

  def first_initial_dot_last_initial  
    "#{first_name[0]}.#{last_name[0]}@#{company}"
  end 


end 