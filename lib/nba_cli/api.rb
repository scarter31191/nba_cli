class API

    def self.get_data
        response = HTTParty.get("https://www.balldontlie.io/api/v1/teams")
        teams = JSON.parse(response.body)["data"]
        teams.each do |team|
            Team.new(team)
        end
    end

end