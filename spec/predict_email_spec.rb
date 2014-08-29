require_relative 'spec_helper'

describe PredictEmail::PredictEmail do 

  let(:prediction) { PredictEmail::PredictEmail.new }

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


  describe '#first_name_dot_last_name' do 
    it 'converts the name to appropriate email' do 
      expect(prediction.first_name_dot_last_name("Peter Wong", "alphasights.com")).to eq('peter.wong@alphasights.com')
    end 
  end 

  describe '#first_name_dot_last_initial' do 
    it 'converts the name to appropriate email' do 
      expect(prediction.first_name_dot_last_initial("Craig Silverstein", "google.com")).to eq('craig.s@google.com')
    end 
  end 

  describe '#first_initial_dot_last_name' do 
    it 'converts the name to appropriate email' do 
      expect(prediction.first_initial_dot_last_name("Marty Hart", "truedetective.com")).to eq('m.hart@truedetective.com')
    end 
  end 

  describe '#first_initial_dot_last_initial' do 
    it 'converts the name to appropriate email' do 
      expect(prediction.first_initial_dot_last_initial("Marty Hart", "truedetective.com")).to eq('m.h@truedetective.com')
    end 
  end

end 





