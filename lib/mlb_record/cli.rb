class MlbRecord::CLI

    def call
        MlbRecord::Scraper.new.make_teams
        puts "Welcome to the MLB Team Record Tracker!"
        menu    
    end

    def menu
        all_teams
        puts "Pick a team by chosing the corresponding number 1-30"
        input = gets.strip
    end

    def all_teams
        MlbRecord::Team.all.each.with_index(1) {|team, index| puts "#{index}. #{team.name}"}
    end

end