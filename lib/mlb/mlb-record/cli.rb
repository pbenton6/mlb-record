class CLI

    def call
        Scraper.new.make_teams
        puts "MLB Team Record Tracker"     
        menu

    end

    def menu
        all_teams
        puts "Pick a team by chosing the corresponding number 1-30"
        input = gets.strip
    end

    def all_teams
        Team.all.each.with_index(1) { |team, index| puts "#{i} #{team.name}"}
    end
end
