require 'rspec'
require_relative '../predict_email'

#predict following emails 
# "Peter Wong", "alphasights.com"
# "Craig Silverstein", "google.com"
# "Steve Wozniak", "apple.com"
# "Barack Obama", "whitehouse.gov"

#todo 
  #create class that has patterns & sample data 
  #method that takes in name and company and figures out which pattern(s) that company uses
  #method returns what pattern(s) the company uses 

describe PredictEmail do 

  let(:prediction) { PredictEmail.new }

  let(:four_patterns) { 
    {
      first_name_dot_last_name: "john.ferguson@alphasights.com",
      first_name_dot_last_initial: "john.f@alphasights.com",
      first_initial_dot_last_name: "j.ferguson@alphasights.com",
      first_initial_dot_last_initial: "j.f@alphasights.com"
    }
  }

  let(:sample_emails) {
    {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com"
    }
  }


  describe '#new' do 
    it 'is an instance of PredictEmail' do 
      expect(prediction).to be_instance_of(PredictEmail)
    end

    it 'has the four possible patterns on initialization' do 
      expect(prediction.patterns).to eq(four_patterns)
    end 

    it 'has the sample data on initialization' do 
      expect(prediction.emails).to eq(sample_emails)
    end 

  end 


end 





