require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render without an error" do
    visit new_paper_path
  end

  it "should have text inputs for the papers title, venue, and year" do
    visit new_paper_path

    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should have a button to create a new paper" do
    visit new_paper_path
    expect(page).to have_css('input[type="submit"]')
  end

  it "should have a multiple selection field" do
    visit new_paper_path

    expect(page).to have_select(multiple: true)
  end
end
