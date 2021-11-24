class Author < ApplicationRecord
    def name
        "%s %s" % [self.first_name, self.last_name]
    end
end
