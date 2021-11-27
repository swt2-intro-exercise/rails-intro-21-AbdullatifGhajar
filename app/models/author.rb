class Author < ApplicationRecord
    validates :last_name, presence: true, length: { minimum: 1 }

    has_many :papers
    def name
        "%s %s" % [self.first_name, self.last_name]
    end
end
