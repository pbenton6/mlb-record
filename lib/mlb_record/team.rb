require './lib/mlb_record.rb'

class MlbRecord::Team
    
    attr_accessor :fullname, :record, :city, :nickname
    
    @@all = []

    def self.new_from_index(index)
        self.new(
            index.css(".teamname").text.delete!("\n"),
            index.css(".teamrecord").text.delete!("\n")
            )
    end

    def initialize(fullname=nil, record=nil, link_to_schedule=nil, nickname=nil)
        @fullname = fullname
        @record = record
        @nickname = @fullname.split[-1]
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find(team_index)
        self.all[team_index - 1]
    end
end

