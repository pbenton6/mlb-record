class MlbRecord::CLI

    def call
        Scraper.new.make_teams
        puts "MLB Team Record Tracker"     
        menu

    end

    def menu
        all_teams
        puts "Pick a team by chosing the corresponding number 1-30"
        input = gets.strip

        team = MlbRecord::Team.find(input.to_i)
        team_record(team)
    end

    def all_teams
        MlbRecord::Team.all.each.with_index(1) { |team, index| puts "#{i} #{team.name}"}
    end

    def team_record(team)
        puts "Team: #{team.name}"
        puts "Division: #{team.conference} #{team.division}"
        puts "Record: #{team.record}"
    end
end
