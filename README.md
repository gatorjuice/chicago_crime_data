# ChicagoCrimeData

A Ruby wrapper for chicago crime statistics since 2001.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chicago_crime_data'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chicago_crime_data

## Usage

To get all Chicago crime data use this command:

```Ruby
crimes_data_set = ChicagoCrimeData::Crime.all
```

To search by one of many parameters for specific Chicago crime data use this command with any or all of the following hash keys:

```Ruby
narrowed_data_set = ChicagoCrimeData::Crime.find(
    {
        case_number: [value],
        primary_type: [value],
        beat: [value],
        year: [value],
        description: [value],
        x_coordinate: [value],
        y_coordinate: [value],
        block: [value],
        primary_type: [value],
        location_description: [value],
        date: [value],
        iucr: [value],
        domestic: [value],
        id: [value],
        ward: [value],
        arrest: [value],
        updated_on: [value],
        fbi_code: [value],
        longitude: [value],
        latitude: [value],
        year: [value],
        community_area: [value],
        district: [value]
    }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/chicago_crime_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
