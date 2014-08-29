# PredictEmail
[![Gem Version](https://badge.fury.io/rb/predict_email.svg)](http://badge.fury.io/rb/predict_email)
[![Code Climate](https://codeclimate.com/repos/53ff211a6956807cee01ecad/badges/9f8afa9a0ff41f8e85ff/gpa.svg)](https://codeclimate.com/repos/53ff211a6956807cee01ecad/feed)
[![Build Status](https://travis-ci.org/kylefdoherty/email-prediction.svg?branch=master)](https://travis-ci.org/kylefdoherty/email-prediction)
[![Coverage Status](https://img.shields.io/coveralls/kylefdoherty/email-prediction.svg)](https://coveralls.io/r/kylefdoherty/email-prediction?branch=master)

Predict Email was a coding challenge I recieved from a company. The challenge was to create an email predictor that uses current contacts, such as: Linda Li,linda.li@alphasights.com, Sergey Brin,s.brin@google.com, Steve Jobs,s.j@apple.com, etc. to predict what a given person's email should be.  So for example, if I input: "Jane Doe, Apple.com", it should predict that Jane's email should be - j.d@apple.com.

If you install the gem it comes with a sample-data.csv file which contains 7 contacts from various companies. If you fork and clone the repo you can upload your own csv file, see intsallation below for more info.

## Installation

There are two ways to use this gem: 

###1st

Install the Gem:

    gem install predict_email

This will install the gem locally, and allow you to predict emails using the sample data.

After installing the gem, run:

    $ predict_email

This will prompt you to enter a name and company website.

###2nd

Fork and clone this repo: 

    git clone git@github.com:{your-github-username}/predict-email.git

Run Bundle install: 

    bundle install

Add your own csv file with names and company emails to lib/predict_email/csv:

    ![alt tag](https://raw.githubusercontent.com/kylefdoherty/predict-email/master/images/add_csv_file.png)






## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/predict_email/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
