require 'rails_helper'

describe "Show authors index page", type: :feature do
  it "should exist at 'authors_path' and render without an error" do
    visit authors_path
  end
end