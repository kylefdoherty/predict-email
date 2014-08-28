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

  #need to return error message or something if there are no email examples for that company
    #for now going to assume always have email samples for all companies 
  #if returnd contact emails don't have dots (don't fit 1 of 4 patterns) return some
    #sort of error - for now assume that doesn't happen 

describe PredictEmail do 

  let(:prediction) { PredictEmail.new }

  let(:sample_emails) {
    {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
      "Larry Page" => "larry.p@google.com",
      "Sergey Brin" => "s.brin@google.com",
      "Steve Jobs" => "s.j@apple.com",
      "Kyle Doherty" => "kyle_doherty@flatironschool.com"
    }
  }


  #create class that has patterns & sample data
  describe '#new' do 
    it 'is an instance of PredictEmail' do 
      expect(prediction).to be_instance_of(PredictEmail)
    end

    it 'has the sample data on initialization' do 
      expect(prediction.emails).to eq(sample_emails)
    end 
  end 

  #method that takes in name and company and figures out which pattern(s) that company uses

  #first need to get the emails for that company we already have
  describe '#find_contacts' do 
    alphasights_emails = {"John Ferguson" => "john.ferguson@alphasights.com", 
                          "Damon Aw" => "damon.aw@alphasights.com", 
                          "Linda Li" => "linda.li@alphasights.com"}

    it 'takes the name and company and returns what pattern(s) that company uses for emails' do 
      expect(prediction.find_contacts("alphasights")).to eq(alphasights_emails)
    end 
  end 

  #loop through the emails we have and figure out what each uses 
  #and store them in a patterns collection 

  describe 'find_patterns' do 
    context 'compnay uses one email pattern' do 
      it 'returns the pattern(s) that company uses' do 
        expect(prediction.find_patterns('AlphasiGhts')).to eq(['first_name_dot_last_name'])
      end 
    end     

    context 'compnay uses more than one email pattern' do 
      it 'returns the pattern(s) that company uses' do 
        expect(prediction.find_patterns('Google')).to eq(['first_name_dot_last_initial','first_initial_dot_last_name' ])
      end 
    end 

    context 'company email pattern is not one of four checking for' do 
      it 'returns that it can not predict that pattern' do 
        expect(prediction.find_patterns('Flatiron School')).to eq(["Sorry, we can't predict pattern for this company."])
      end 
    end 

    context 'no emails are returned for that company' do 
      it 'returns that there are no contacts for that company' do 
        expect(prediction.find_patterns('Partner Group')).to eq(["Sorry, we don't have any contacts for that company to make a prediction from."])
      end 
    end 


  end 





end 





