require_relative 'spec_helper'

describe PredictEmail::PredictEmail do 

  let(:prediction) { PredictEmail::PredictEmail.new }

  describe '#predict_email' do 

    context 'company uses one pattern' do 
      it "predicts the person's email and returns pattern and predicted email" do 

        expected_response = "alphasights.com uses 1 email pattern: first_name_dot_last_name. We predict Peter Wong's email to be: peter.wong@alphasights.com."
     
        expect(PredictEmail::PredictEmail.new( "Peter Wong", "alphasights.com").predict_email).to eq(expected_response)
      end 
    end 

    context 'company uses more than one pattern' do 
      it "predicts the person's email and returns patterns and predicted emails" do
        expected_response = "google.com uses 2 email patterns: first_name_dot_last_initial, first_initial_dot_last_name. We predict Craig Silverstein's email to be: craig.s@google.com OR c.silverstein@google.com."

        expect(PredictEmail::PredictEmail.new("Craig Silverstein", "google.com").predict_email).to eq(expected_response)

      end  
    end 

    context 'company uses more than one pattern' do 
      it "tells user can't predict the email for this person" do
        expected_response = "Sorry, we can't predict the email for this person."

        expect(PredictEmail::PredictEmail.new("Avi Flombaum", "flatironschool.com").predict_email).to eq(expected_response)

      end  
    end 

    context 'no contacts for that company' do 
      it "tells user can't predict email for this person" do
        expected_response = "Sorry, we can't predict the email for this person."

        expect(PredictEmail::PredictEmail.new("Rust Cohle", "truedetective.com").predict_email).to eq(expected_response)

      end  
    end 

  end 



end 





