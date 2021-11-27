require 'rails_helper'

RSpec.describe Author, type: :model do
    it "should have a constructor to create new author object" do
        author = Author.new
        expect(author).to be_an_instance_of(Author)
    end

    
    it "should not be valid without last name" do
        author = build :author
        expect(author).to be_valid

        author.last_name = ""
        expect(author).to_not be_valid

        author.last_name = nil
        expect(author).to_not be_valid
    end

    it "should should be able to set attributes after creating" do
        first_name = "Alan"
        last_name = "Turing"
        homepage = 'http://wikipedia.org/Alan_Turing'
        author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)

        expect(author.first_name).to eq(first_name)
        expect(author.last_name).to eq(last_name)
        expect(author.homepage).to eq(homepage)
    end

    it "should have the name method, which is first name + second name" do
        author = build :author
        expect(author.name).to eq("Alan Turing")
    end
end
