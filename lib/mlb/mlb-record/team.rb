class Team
    
    attr_accessor :name, :record, :conference, :divsion
    
    @@all = []

    def self.new_from_index(index)
        self.new(
            index.css(".teamname").text,
            index.css(".teamrecord").text,
            index.css(".conference").text,
            index.css(".division").text
        )
    end

    def initialize(name=nil, record=nil, conference=nil, division=nil)
        @name = name
        @record = record
        @conference = conference
        @division = division
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find(team_index)
        self.all[team_index - 1]
    end
end