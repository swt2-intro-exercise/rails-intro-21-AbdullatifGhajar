require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist at 'author_path(:id)' and render without an error" do
    author = create :author
    visit author_path(author.id)
  end

  
  it "should have all author info" do
    author = create :author
    visit author_path(author.id)

    expect(page).to have_text("Alan")
    expect(page).to have_text("Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end
end