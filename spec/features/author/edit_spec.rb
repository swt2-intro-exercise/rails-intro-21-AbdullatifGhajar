require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should exist at 'edit_author_path(author.id)' and render without an error" do
    author = create :author
    visit edit_author_path(author.id)
  end

  it "should display existing info of database" do
    author = create :author
    visit edit_author_path(author.id)

    expect(page).to have_field('author[first_name]', with: 'Alan')
    expect(page).to have_field('author[last_name]', with: 'Turing')
    expect(page).to have_field('author[homepage]', with: 'http://wikipedia.de/Alan_Turing')
  end

  it "should save the changed input to database after submitting" do
    author = create :author
    visit edit_author_path(author.id)

    fill_in "author[first_name]", with: "Abdu"
    find('input[type="submit"]').click

    author = Author.where(id: author.id).take
    expect(author.first_name).to eq("Abdu")
  end


end