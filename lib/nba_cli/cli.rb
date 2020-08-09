class NbaCli::CLI

    def call
       puts "WELCOME!"
       puts "=========================="
       puts "To see teams, enter 'teams'"
       puts "=========================="
       puts "To exit, enter 'exit'"
       puts "=========================="
       API.get_data
       menu
    end

    def menu
        input = gets.strip.downcase

        if input == "teams"
            teams_list
            menu
        elsif input == "exit"
            walk_off
        else
            invalid_entery
        end
    end

    def teams_list
        Team.all.each_with_index do |team, index|
            puts "#{index + 1}. #{team.name}"
        end
        puts ""
        puts ""
        puts "Select team by name:"
        input = gets.strip.downcase

        team_selection(input)
    end

    def team_selection(team)
       squad = Team.find_by_name(team)
       squad.each do |t|
        puts "Abbreviation: #{t.abbreviation}"
        puts "City: #{t.city}"
        puts "Division: #{t.division}"
        puts "Full_name: #{t.full_name}"
        puts "Name: #{t.name}"
       end
    end

    def walk_off
       puts "Good Game"
    end

    def invalid_entery
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts "!!FLAGRANT 1, Invalid input!!"
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts "To see teams, enter 'teams'"
        puts "=========================="
        puts "To exit, enter 'exit'"
        menu
    end

end