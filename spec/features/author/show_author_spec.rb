require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist at 'author_path(:id)' and render without an error" do
    author = create :author
    visit author_path(author.id)
  end

  
  it "should have information about an author" do
    create :author
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end
end