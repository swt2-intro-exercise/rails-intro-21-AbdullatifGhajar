require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should have a constructor for creating paper instances" do
    paper = Paper.new
    expect(paper).to be_an_instance_of(Paper)
  end

  it "should not be valid without a title" do
    paper = build :paper
    paper.title = ""
    expect(paper).to_not be_valid

    paper.title = nil
    expect(paper).to_not be_valid
  end

  it "should should be able to set attributes after creating" do
    title = "COMPUTING MACHINERY AND INTELLIGENCE"
    venue = "Mind 49: 433-460"
    year = 1950
    paper = Paper.new(title: title, venue: venue, year: year)

    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)
  end

  it "should not be valid without a numerical year" do
    paper = build :paper

    paper.year = ""
    expect(paper).to_not be_valid

    paper.year = 1999
    expect(paper).to be_valid

    paper.year = 1.5
    expect(paper).to_not be_valid
  end

  it "should have a empty list of authors after creating" do
    paper = Paper.new

    expect(paper.authors).to eq([])
  end

  it "should has references to its authors" do
    paper = create :paper
    author = create :author

    expect(paper.authors.size).to eq(1) 

    expect(paper.authors[0].first_name).to eq(author.first_name) 
    expect(paper.authors[0].last_name).to eq(author.last_name)
    expect(paper.authors[0].homepage).to eq(author.homepage) 
  end
end
