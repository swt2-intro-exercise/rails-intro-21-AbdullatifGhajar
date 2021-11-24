require 'rails_helper'

describe "Show author page", type: :feature do
  it "should render when visiting 'author_path(:id)'" do
    author = create :author
    visit author_path(author.id)
  end
end