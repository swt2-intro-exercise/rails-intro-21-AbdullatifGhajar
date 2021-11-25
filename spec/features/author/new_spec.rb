require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render without errors" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have a field for author's first name, last name and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should have a button to create a new author" do
    visit new_author_path
    expect(page).to have_css('input[type="submit"]')
  end

  it "should work when submitting a filled-out form" do
    visit new_author_path
    fill_in "author[first_name]", with: "Alan"
    fill_in "author[last_name]", with: "Turing"
    fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
  end

  it "should create a new author in the database after submitting the form" do
    author = Author.where(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing").take
    expect(author).to be_nil

    visit new_author_path
    fill_in "author[first_name]", with: "Alan"
    fill_in "author[last_name]", with: "Turing"
    fill_in "author[homepage]", with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click

    author = Author.where(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing").take
    expect(author).not_to be_nil
  end
end
