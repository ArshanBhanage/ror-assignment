class Patient < ApplicationRecord

    def name
        return self.first_name + self.last_name 
    end
end
