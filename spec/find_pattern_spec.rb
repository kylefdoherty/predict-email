require_relative 'spec_helper'

describe PredictEmail::FindPattern do 


  # let(:sample_emails) {
  #   {
  #     "John Ferguson" => "john.ferguson@alphasights.com",
  #     "Damon Aw" => "damon.aw@alphasights.com",
  #     "Linda Li" => "linda.li@alphasights.com",
  #     "Larry Page" => "larry.p@google.com",
  #     "Sergey Brin" => "s.brin@google.com",
  #     "Steve Jobs" => "s.j@apple.com",
  #     "Kyle Doherty" => "kyle_doherty@flatironschool.com"
  #   }
  # }

  let(:prediction) { PredictEmail::FindPattern.new('alphasights') }

  #create class that has patterns & sample data
  # describe '#new' do 
  #   it 'is an instance of PredictEmail' do 
  #     expect(prediction).to be_instance_of(PredictEmail::FindPattern)
  #   end

  #   it 'has the sample data on initialization' do 
  #     expect(prediction.emails).to eq(sample_emails)
  #   end 

  # end 

  #method that takes in name and company and figures out which pattern(s) that company uses

  #first need to get the emails for that company we already have


  #loop through the emails we have and figure out what each uses 
  #and store them in a patterns collection 

  describe '#find_patterns' do 
    context 'compnay uses one email pattern' do 
      it 'returns the pattern(s) that company uses' do 
        expect(PredictEmail::FindPattern.new('Alphasights.com').find_patterns).to eq(['first_name_dot_last_name'])
      end 
    end     

    context 'compnay uses more than one email pattern' do 
      it 'returns the pattern(s) that company uses' do 
        expect(PredictEmail::FindPattern.new('google.com').find_patterns).to eq(['first_name_dot_last_initial','first_initial_dot_last_name' ])
      end 
    end 

    context 'company email pattern is not one of four checking for' do 
      it 'returns that it can not predict that pattern' do 
        expect(PredictEmail::FindPattern.new('flatironschool.com').find_patterns).to eq([])
      end 
    end 

    context 'no emails are returned for that company' do 
      it 'returns that there are no contacts for that company' do 
        expect(PredictEmail::FindPattern.new('partnersgroup.com').find_patterns).to eq([])
      end 
    end 
  end 

end 