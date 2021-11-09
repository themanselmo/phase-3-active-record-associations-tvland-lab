class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows

    def shows
        self.characters.map { |c| c.show }
    end

    def full_name
        self.first_name + " " + self.last_name
    end

    def list_roles
        self.characters.map do |c|
            "#{c.name} - #{c.show.name}"
        end
    end
end