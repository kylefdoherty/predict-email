
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