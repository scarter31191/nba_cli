class Team
    attr_accessor :abbreviation, :city, :conference, :division, :name, :full_name
        
    @@all = []
        
    def initialize(hash)
        hash.each do |k, v| 
            self.send(("#{k}="), v) if self.respond_to?(("#{k}="))
        end
        save
    end
    
    def save
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.select {|team| team.name.downcase == name}
    end

    # def self.first_three
    #     @@all[0..2]
    # end
end