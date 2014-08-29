# PredictEmail
[![Gem Version](https://badge.fury.io/rb/predict_email.svg)](http://badge.fury.io/rb/predict_email)
[![Code Climate](https://codeclimate.com/repos/53ff211a6956807cee01ecad/badges/9f8afa9a0ff41f8e85ff/gpa.svg)](https://codeclimate.com/repos/53ff211a6956807cee01ecad/feed)
[![Build Status](https://travis-ci.org/kylefdoherty/predict-email.svg?branch=master)](https://travis-ci.org/kylefdoherty/predict-email)
[![Coverage Status](https://img.shields.io/coveralls/kylefdoherty/email-prediction.svg)](https://coveralls.io/r/kylefdoherty/email-prediction?branch=master)

Predict Email was a coding challenge I recently recieved, which I decided to turn into a gem to make it easy to use and to learn how to make Ruby Gems. The challenge was to create an email predictor that uses current contacts, such as: Sergey Brin,s.brin@google.com, Steve Jobs,s.j@apple.com, etc. to predict what a given person's email should be.  So for example, if I input: "Jane Doe, Apple.com", it should predict that Jane's email will be - j.d@apple.com.

If you install the gem it comes with a sample-data.csv file which contains 7 contacts from various companies. If you fork and clone the repo you can upload your own csv file, see intsallation below for more info.

## Installation

There are two ways to use this gem: 

###1st

Install the Gem:

    gem install predict_email

This will install the gem locally, and allow you to predict emails using the sample data.

After installing the gem, run:

    $ predict_email

This will prompt you to enter a name and company.

###2nd

Fork and clone this repo: 

    git clone git@github.com:{your-github-username}/predict-email.git

Run Bundle install: 

    bundle install

Add your own csv file with names and company emails to lib/predict_email/csv:

![alt tag](https://raw.githubusercontent.com/kylefdoherty/predict-email/master/images/add_csv_file.png)

In find_pattern.rb change the file path to the csv you added:

![alt tag](https://raw.githubusercontent.com/kylefdoherty/predict-email/master/images/find_pattern_file.png)

![alt tag](https://raw.githubusercontent.com/kylefdoherty/predict-email/master/images/find_pattern_rb_%E2%80%94_predict_email.png)


## Usage

If you've installed the gem locally all you need to do to run it is type:

    predict_email

After that you'll be prompted to give a name and company.  For example, type:

    Rustin Cohle, google

This will return the prediction for his email.  Note that if you don't include a full name or company it will give you an error and tell you to try again.  Additionally, if there is no contacts for a specific a company you input it will not be able to return a prediction.

If you've forked and cloned the repo, simple follow the installation instructions above and then run:

    predict_email

## Next Steps 

* Look into using Thor for the CLI
* Look into allowing users to update the csv file after installing gem so don't have to clone repo to do so 


## Contributing

1. Fork it ( https://github.com/kylefdoherty/predict_email/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
