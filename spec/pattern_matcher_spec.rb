require_relative 'spec_helper'

describe PredictEmail::PatternMatcher do 

  describe '#first_name_dot_last_name' do 
    it 'converts the name to appropriate email' do 
      expect(PredictEmail::PatternMatcher.new("Peter Wong", "first_name_dot_last_name", "alphasights.com" ).return_match).to eq('peter.wong@alphasights.com')
    end 
  end 

  describe '#first_name_dot_last_initial' do 
    it 'converts the name to appropriate email' do 
      expect(PredictEmail::PatternMatcher.new("Craig Silverstein", "first_name_dot_last_initial", "google.com").return_match).to eq('craig.s@google.com')
    end 
  end 

  describe '#first_initial_dot_last_name' do 
    it 'converts the name to appropriate email' do 
      expect(PredictEmail::PatternMatcher.new("Marty Hart", "first_initial_dot_last_name", "truedetective.com").return_match).to eq('m.hart@truedetective.com')
    end 
  end 

  describe '#first_initial_dot_last_initial' do 
    it 'converts the name to appropriate email' do 
      expect(PredictEmail::PatternMatcher.new("Marty Hart", "first_initial_dot_last_initial", "truedetective.com").return_match).to eq('m.h@truedetective.com')
    end 
  end

end 