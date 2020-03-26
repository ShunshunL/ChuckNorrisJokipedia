# Chuck Norris Jokipedia

A simple Ruby application that utilizes a command-line interface to display random Chuck Norris Jokes. Jokes can be saved to your account for later viewing. The jokes themselves are pulled from https://api.chucknorris.io/, and then stored in a local SQLite3 database using ActiveRecord. 

## Getting Started

1. Fork this repository
2. `cd` into the folder you want this to be located through terminal.
3. Clone it into the folder using `git clone`.

### Prerequisites

Paste this into your termimal and it should automatically install everything you need:
`curl -so- https://raw.githubusercontent.com/learn-co-curriculum/flatiron-manual-setup-validator/master/automatic-install.sh | bash 2> /dev/null` 

You should see this if this worked: 
```
##########################
# INSTALLATIONS COMPLETE #
##########################
```

If this does not appear, follow the manual set up here: 
https://github.com/learn-co-curriculum/environment-mac-os-catalina-setup

### Installing

Type `bundle install` in your terminal 

## Deployment

Type this in terminal: `ruby bin/run.rb`

## Built With

* [Ruby 2.6](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/) - language used
* [SQLite 3](https://www.sqlite.org/version3.html) - database engine
* [REST Client](https://github.com/rest-client/rest-client) - used to GET data from the API
* [Active Record](https://guides.rubyonrails.org/active_record_basics.html) - used to manage model relationship in database
* [TTY::Prompt](https://github.com/piotrmurach/tty-prompt) - used to prettify the app and makes the user experience intuitive

## Author

**Shunshun Lyu** 
[Read more about me](https://www.shunshunl.com/)
