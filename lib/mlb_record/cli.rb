class MlbRecord::CLI

    def call
        MlbRecord::Scraper.new.make_teams
        puts "Welcome to the MLB Team Record Tracker!"
        menu    
    end

    def menu
        all_teams
        puts ""
        puts "Pick a team by chosing the corresponding number"
        puts "1-30: regualar season"
        puts "31-60: spring training"
        puts "'exit' to exit"
        input = gets.strip

        valid_input?(input)
        until valid_input?(input) == true
            puts "Please try again with a number 1-60 or 'exit'"
            input = gets.strip
            valid_input?(input)
        end


        if input == 'exit'
            exit
        else 
            team = MlbRecord::Team.find(input.to_i)
            team_record(team)

            puts ""
            puts "Would you like to learn about another team?"
            puts "Enter 'yes' for more or 'no' to exit"
            
            input = gets.strip
            if input == "no"
                exit
            elsif input == "yes"
                menu
            else
                puts "invalid input, please enter 'yes' or 'no'. Returning to menu"
                menu
            end
        end
    end

    def all_teams
        MlbRecord::Team.all.each.with_index(1) {|team, index| print "
        #{index}: #{team.fullname}
        "}
    end

    def team_record(team)
        puts "Team: #{team.fullname}"
        puts "Record: #{team.record}"
        puts "Team Schedule: https://www.mlb.com/#{team.nickname}/schedule/" 
        puts "For news, and more detailed information: #{team.team_page}"
    end

    def exit
        puts "Thank you! Have a nice day and be sure to check in again soon!"
    end

    def valid_input?(input)
        !input == nil || input.to_i.between?(1,61) || input == 'exit'
    end


end