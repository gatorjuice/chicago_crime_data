require "chicago_crime_data/version"
require "unirest"

module ChicagoCrimeData
  
  class Crime

    attr_accessor :case_number, :beat, :x_coordinate, :block, :primary_type, :location_description, :date, :iucr, :domestic, :id, :ward, :arrest, :description, :y_coordinate, :updated_on, :fbi_code, :longitude, :year, :community_area, :latitude, :district

    def initialize(input_options)
      @case_number = input_options["case_number"]
      @primary_type = input_options["primary_type"]
      @beat = input_options["beat"]
      @year = input_options["year"]
      @description = input_options["description"]
      @x_coordinate = input_options["x_coordinate"]
      @y_coordinate = input_options["y_coordinate"]
      @block = input_options["block"]
      @primary_type = input_options["primary_type"]
      @location_description = input_options["location_description"]
      @date = input_options["date"]
      @iucr = input_options["iucr"]
      @domestic = input_options["domestic"]
      @id = input_options["id"]
      @ward = input_options["ward"]
      @arrest = input_options["arrest"]
      @updated_on = input_options["updated_on"]
      @fbi_code = input_options["fbi_code"]
      @longitude = input_options["longitude"]
      @latitude = input_options["latitude"]
      @year = input_options["year"]
      @community_area = input_options["community_area"]
      @district = input_options["district"]
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
      data = Unirest.get("https://data.cityofchicago.org/resource/ijzp-q8t2.json?#{search}=#{string}&$limit=#{limit}&$offset=#{offset}").body
      crimes = []
      data.each do |crime|
        crimes << Crime.new(crime)
      end 
      crimes
    end

  end

end
