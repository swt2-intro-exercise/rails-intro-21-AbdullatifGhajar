require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should exist at 'authors_path' and render without an error" do
    visit authors_path
  end

  it "should have information about a created author" do
    create :author
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end

  it "should have a link to 'new_author_path'" do
    visit authors_path
    expect(page).to have_link "New", href: new_author_path
  end

  it "should have a link to the page of each existing author" do
    author = create :author
    visit authors_path

    expect(page).to have_link "Details", href: author_path(author.id)
  end

  it "should have a link for editting each existing author" do
    author = create :author
    visit authors_path

    expect(page).to have_link "Edit", href: edit_author_path(author.id)
  end

  
  it "should have a link for deleting each author" do
    author = create :author
    visit authors_path

    click_on("Delete")

    author2 = Author.where(id: author.id).take
    expect(author2).to be_nil
  end
end