require "chicago_crime_data/version"
require "unirest"

module ChicagoCrimeData
  # Your code goes here...
  class Crime

    attr_reader :case_number, :beat, :x_coordinate, :block, :primary_type, :location_description, :date, :iucr, :domestic, :id, :ward, :arrest, :description, :y_coordinate, :updated_on, :fbi_code, :longitude, :year, :community_area, :latitude, :district

    def initialize(input_options)
      @case_number = input_options["case_number"]
      @primary_type = input_hash["primary_type"]
      @beat = input_options["beat"]
      @year = input_options["year"]
      @description = input_options["description"]
    end

    def self.all
      data = Unirest.get('https://data.cityofchicago.org/resource/ijzp-q8t2.json').body
      crimes = []
      data.each do |crime|
        crimes << Crime.new(crime)
      end
      crimes
    end

    def self.find(input_hash)
      search = input_hash[:search] || nil
      string = input_hash[:string] || nil
      limit = input_hash[:limit] || nil
      offset = input_hash[:offset] || nil
      p search
      p string
      p limit
      p offset
      data = Unirest.get("https://data.cityofchicago.org/resource/ijzp-q8t2.json?#{search}=#{string}&$limit=#{limit}&$offset=#{offset}").body
      crimes = []
      data.each do |crime|
        crimes << Crime.new(crime)
      end 
      crimes
    end

  end

end
