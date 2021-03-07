require './lib/mlb_record.rb'

class MlbRecord::Team
    
    attr_accessor :fullname, :record, :nickname, :team_page
    
    @@all = []

    def self.new_from_index(index)
        self.new(
            index.css(".teamname").text.delete!("\n"),
            index.css(".teamrecord").text.delete!("\n"),
            "https://www.msn.com#{index.css("a").attribute("href").text}"
            )
    end

    def initialize(fullname=nil, record=nil, team_page=nil)
        @fullname = fullname
        @record = record
        @nickname = @fullname.split[-1]
        @team_page = team_page
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find(team_index)
        self.all[team_index - 1]
    end
end

