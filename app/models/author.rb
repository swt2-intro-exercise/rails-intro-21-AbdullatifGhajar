class Author < ApplicationRecord
    validates :last_name, presence: true, length: { minimum: 1 }
    def name
        "%s %s" % [self.first_name, self.last_name]
    end
end
