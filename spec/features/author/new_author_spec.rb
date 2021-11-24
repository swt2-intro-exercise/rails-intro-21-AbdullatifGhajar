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
end
