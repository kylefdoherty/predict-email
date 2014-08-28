require 'rspec'
require_relative '../predict_email'

#predict following emails 
# "Peter Wong", "alphasights.com"
# "Craig Silverstein", "google.com"
# "Steve Wozniak", "apple.com"
# "Barack Obama", "whitehouse.gov"

#todo 
  #create class that has sample data 
  #method that takes in name and company and figures out which pattern(s) that company uses
  #method returns what pattern(s) the company uses

  #need to return error message or something if there are no email examples for that company
    #for now going to assume always have email samples for all companies 
  #if returnd contact emails don't have dots (don't fit 1 of 4 patterns) return some
    #sort of error - for now assume that doesn't happen 

  #create method that accepts the name and company and returns:
    #company x uses # of pattern(s): pattern
    #F_Name L_Name's email is most likely x or y (if there is more than one pattern used)

    #create tests for 1 pattern, multiple, not 1 of 4 patterns, no examples from company
    #create tests for 4 pattern methods
    #refactor code for methods
    #review code and break into smaller classes
    #create CLI 
    #build out readme to explain app and how to use - make like Avi's where just clone & run command
    #make sample emails pull from a file so user can add to file or user another one
    #create rails app that utilizes this code for models, allows user to add emails or upload csv
      #then can input a name and company name and get back a prediction 

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

  describe '#find_patterns' do 
    context 'compnay uses one email pattern' do 
      it 'returns the pattern(s) that company uses' do 
        expect(prediction.find_patterns('Alphasights.com')).to eq(['first_name_dot_last_name'])
      end 
    end     

    context 'compnay uses more than one email pattern' do 
      it 'returns the pattern(s) that company uses' do 
        expect(prediction.find_patterns('google.com')).to eq(['first_name_dot_last_initial','first_initial_dot_last_name' ])
      end 
    end 

    context 'company email pattern is not one of four checking for' do 
      it 'returns that it can not predict that pattern' do 
        expect(prediction.find_patterns('flatironschool.com')).to eq([nil])
      end 
    end 

    context 'no emails are returned for that company' do 
      it 'returns that there are no contacts for that company' do 
        expect(prediction.find_patterns('partnersgroup.com')).to eq([nil])
      end 
    end 

  end 

  describe '#predict_email' do 

    context 'company uses one pattern' do 
      it "predicts the person's email and returns pattern and predicted email" do 

        expected_response = "alphasights.com uses 1 email pattern: first_name_dot_last_name. We predict Peter Wong's email to be: peter.wong@alphasights.com."
     
        expect(prediction.predict_email( "Peter Wong", "alphasights.com")).to eq(expected_response)
      end 
    end 

    context 'company uses more than one pattern' do 
      it "predicts the person's email and returns patterns and predicted emails" do
        expected_response = "google.com uses 2 email patterns: first_name_dot_last_initial, first_initial_dot_last_name. We predict Craig Silverstein's email to be: craig.s@google.com OR c.silverstein@google.com."

        expect(prediction.predict_email("Craig Silverstein", "google.com")).to eq(expected_response)

      end  
    end 

    context 'company uses more than one pattern' do 
      it "tells user can't predict the email for this person" do
        expected_response = "Sorry, we can't predict the email for this person."

        expect(prediction.predict_email("Avi Flombaum", "flatironschool.com")).to eq(expected_response)

      end  
    end 

    context 'no contacts for that company' do 
      it "tells user can't predict email for this person" do
        expected_response = "Sorry, we can't predict the email for this person."

        expect(prediction.predict_email("Rust Cohle", "truedetective.com")).to eq(expected_response)

      end  
    end 
    
  end 

end 





