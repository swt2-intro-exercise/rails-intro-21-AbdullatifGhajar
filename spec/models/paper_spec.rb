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
end
