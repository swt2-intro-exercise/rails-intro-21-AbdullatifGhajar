require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist at 'author_path(:id)' and render without an error" do
    author = create :author
    visit author_path(author.id)
  end

  it "should contain all info about an author" do
    author = create :author
    visit author_path(author.id)

    expect(page).to have_text(author.first_name)
    expect(page).to have_text(author.last_name)
    expect(page).to have_text(author.homepage)
  end
end