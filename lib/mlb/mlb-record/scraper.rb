require 'nokogiri'
require 'open-uri'

require_relative './team.rb'

class MlbRecord::Scraper
    
    def get_page
        Nokogiri::HTML(open("https://www.msn.com/en-us/sports/mlb/teams"))
    end

    def get_teams
        self.get_page.css("div.teams")
    end

    def make_teams
        get_teams.each do |index|
            Team.new_from_index(index)
        end
    end
end