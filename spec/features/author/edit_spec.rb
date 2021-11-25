require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should exist at 'edit_author_path(author.id)' and render without an error" do
    author = create :author
    visit edit_author_path(author.id)
  end

end