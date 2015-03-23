require 'rails_helper'

describe "Add new blog process" do
  it "adds a new blog" do
    visit blogs_path
    click_on "Create new blog"
    fill_in "Title", with: "Test blog"
    fill_in "Date", with: "2015/02/02"
    fill_in "Body", with: "Test body text"
    click_on "Create Blog"
    expect(page).to have_content "Blogs"
  end

  it "trys to add blog with empty fields" do
    visit blogs_path
    click_on "Create new blog"
    click_on "Create Blog"
    expect(page).to have_content "errors"
  end
end
