# Trek Tracker README

## Getting Started

Fork and clone this repo to your machine to get started.  

Navigate to the directory and run `bundle install` then `rake db:migrate`

When complete, run `rails s` and navigate to the address in your terminal to view the app.

## Project Description

This is my Ruby on Rails portfolio project for the Flatiron School.  The project requirements are to build a fully functioning Rails app.  Please see `spec.md` for more detailed requirements.

I created Trek Tracker to be an outdoorsy to-do list. I wanted to make an application for hikers to be able to keep track of the hiking destinations that they would like to visit, and to be able to log trails that they have visited before.  Hikers can log in through standard credentials or their Google account.

## Technology Used
  * Ruby 2.3.3
  * Ruby on Rails 5.2.1
  * OmniAuth

## Future Features -- Small Steps
  * Adding an `:email_address` attribute to the Hiker class instead of just `:username`
  * Normalizing `:username` attribute to be all downcase instead of case-sensitive
  * Creating a navbar at the top of the page, replacing the navigation links in the footer

## Future Future Features -- Bigger Steps 
  * Adding validations to the Hiker's `:hometown` and the Trail's `:location` attributes (i.e. Is this a US city, does this zipcode exist, can this be found on a map)
  * Calculating the distance between the Hiker and the Trail that they aspire to hike to
  * Embed maps to the Hiker's profile that show pins color coded to show the trails that they would like to hike, and which they have completed already.
